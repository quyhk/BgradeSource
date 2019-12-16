import React from 'react';
import {connect} from 'react-redux'
import * as acceptRequest from '../../../actions/GetRequest/acceptRequest'
import * as updateRequest from '../../../actions/GetRequest/updateRequestDBForPDT'
import {bindActionCreators} from 'redux';
import * as actionGetStudent from '../../../actions/lecturerGetStudentClass';
import * as actionNumberRequest from '../../../actions/GetRequest/numberRequest'


class TableItem extends React.Component {
	constructor(props){
		super(props);
		this.state = {
			renderAgain : false
		}
	}
	changeLeterSemester = (letter) => {
		if (letter === 1)
			return 'I';
		else if (letter === 2)
			return "II";
		return "Summer"
	}
	ignoreSpaces(string) {
		var temp = "";
		string = '' + string;
		let splitstring = string.split(" ");
		for(let i = 0; i < splitstring.length; i++)
		temp += splitstring[i];
		return temp;
	}
	handleAccept = (data, decision) =>{
		
		//goi api accept tren database => goi action update lai state
		const {updateRequestCreators} = this.props;
		const {actionUpdateRequestDBForPDT} = updateRequestCreators;
		actionUpdateRequestDBForPDT({
			Decision : decision,
			ID : data.ID,
			Type : 'PDT'
		})
		//sessionStorage.setItem('request', Number(sessionStorage.getItem('request')) - 1)
		const {actionNumberRequestCreators} = this.props
		const {actionUpdateNumberRequest} = actionNumberRequestCreators
		actionUpdateNumberRequest({})
		this.setState({
			renderAgain : !this.state.renderAgain
		})


        //goi api accept tren blockchain
        const {acceptRequestCreators} = this.props;
        const {actionAcceptRequest} = acceptRequestCreators;
        const paramBC = {
            Address : '0x06fB399b9245cb14693Ea430323f2e6b15336E1b',
            PrivateKey : 'E2B5B2798E30B3302D3F4668492112DF83A7997CC29BAC06F338ECBBB5AFDF31',
            Decision :decision,
            id : data.STT,
            Class : this.ignoreSpaces(`${data.Session_Year}-${this.changeLeterSemester(data.Session_Semester)}-${data.Session_ID}-${data.Course_ID}`)
        }
        //console.log(paramBC)
        actionAcceptRequest(paramBC)
	}
	getStudent = (data) =>{
		const {actionGetStudentC} = this.props;
        const {actionGetLecturerStudentClass} = actionGetStudentC;
        actionGetLecturerStudentClass({
			Session_ID : data.Session_ID,
			OnlyTakeStudentClass : true,
		})
		this.props.currentRequest(data)
	}
	render() {
	  return (
		<tr>
			<td>{this.props.stt}</td>
			<td>
			  <span>
			  		{"Lecturer " + this.props.data.Lecturer_Name + " - " +
						this.props.data.Dep_Name + " has requested to edit the grade of " + this.props.data.OutLine_Name
						+ " - " + this.props.data.Course_Name
					}
			  </span>
			</td>
			<td>
				<span className="label label-info" onClick={()=>this.getStudent(this.props.data)} data-toggle="modal" data-target="#myModal" >Detail</span>
			</td>
			<td>{this.props.data.Reason}</td>
			<td>
				{this.props.data.DateTime}
			</td>
			<td>
				{
					this.props.data.AcceptByPDT === 0
						? (
							<div>
								<button type="button" onClick={()=>this.handleAccept(this.props.data, 1)} className="btn btn-success">Accept</button>
								<button type="button" onClick={()=>this.handleAccept(this.props.data, -1)} className="btn btn-warning">Deny</button>
							</div>
						)
						: this.props.data.AcceptByPDT === 1
							? "Accepted"
							: "Denied"
				}
			</td>
		  </tr>
	  )
	}
}
const mapStateToProps = state => {
	return {
		requests : state.getRequest
	};
};
const mapDispatchToProps = dispatch => {
	return {
		acceptRequestCreators : bindActionCreators(acceptRequest, dispatch),
		updateRequestCreators : bindActionCreators(updateRequest, dispatch),
		actionGetStudentC : bindActionCreators(actionGetStudent, dispatch),
		actionNumberRequestCreators : bindActionCreators(actionNumberRequest, dispatch)
	};
};
export default connect(mapStateToProps, mapDispatchToProps)(TableItem);