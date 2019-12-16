import React from 'react';
import {connect} from 'react-redux'
import * as acceptRequest from '../../../actions/GetRequest/acceptRequest'
import * as lecturerRequestUploadGrade from '../../../actions/GetRequest/lecturerRequestUploadGrade'
import * as lecturerUpdateRequest from '../../../actions/GetRequest/updateRequestDBForLecturer'
import {bindActionCreators} from 'redux';
import * as actionGetStudent from '../../../actions/lecturerGetStudentClass';
import * as actionNumberRequest from '../../../actions/GetRequest/numberRequest'


class TableItem extends React.Component {
	constructor(props){
		super(props)
		this.state = {
			renderAgain : false,
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
        //goi api accept tren blockchain
        const {acceptRequestCreators} = this.props;
        const {actionAcceptRequest} = acceptRequestCreators;
        const paramBC = {
            Address : '0x6DeFAd2d9841203B9C7062c143FEd7295d065aaE',
            PrivateKey : '2c950eba9f6ddbc30db5d607f8db31b4aed7fa12fa9f74b8997cb09fb9af609e',
            Decision :decision,
            id : data.STT,
            Class : this.ignoreSpaces(`${data.Session_Year}-${this.changeLeterSemester(data.Session_Semester)}-${data.Session_ID}-${data.Course_ID}`)
        }
        //console.log(paramBC)
        actionAcceptRequest(paramBC)
		//goi api accept tren database => goi action update lai state
		const {updateRequestCreators} = this.props;
		const {actionUpdateRequestDBForDean} = updateRequestCreators;
		actionUpdateRequestDBForDean({
			Decision : decision,
			ID : data.ID
		})
	}

	onSubmitGrade = (data) =>{
		//update request db truoc
		const {lecturerUpdateRequestCreators} = this.props;
		const {actionUpdateRequestDBForLecturer} = lecturerUpdateRequestCreators;
		actionUpdateRequestDBForLecturer({
			ID : data.ID,
			Type : 'Lecturer',
			Value : 1,
			Session_ID: data.Session_ID,
            OutLine_ID: data.OutLine_ID,
		})
		const {actionNumberRequestCreators} = this.props
		const {actionUpdateNumberRequest} = actionNumberRequestCreators
		actionUpdateNumberRequest({})
		this.setState({
			renderAgain: !this.state.renderAgain
		})

		//upload grad blockchain
		const arrayGrade = data.Grade.split("-")
		const paramBC = {
			Address : '0x6DeFAd2d9841203B9C7062c143FEd7295d065aaE',
			PrivateKey : '2c950eba9f6ddbc30db5d607f8db31b4aed7fa12fa9f74b8997cb09fb9af609e',
			Class  : this.ignoreSpaces(`${data.Session_Year}-${this.changeLeterSemester(data.Session_Semester)}-${data.Session_ID}-${data.Course_ID}`),
			id: data.STT,
			ArrayGrade : arrayGrade,
			outlineID : data.OutLine_ID
		}
		console.log(paramBC)
		const {lecturerRequestUploadGradeCreators} = this.props;
		const {actionLecturerRequestUploadGrade}  = lecturerRequestUploadGradeCreators
		actionLecturerRequestUploadGrade(paramBC)
	}
	onCancelSubmitGrade = (data) =>{
		const {lecturerUpdateRequestCreators} = this.props;
		const {actionUpdateRequestDBForLecturer} = lecturerUpdateRequestCreators;
		actionUpdateRequestDBForLecturer({
			ID : data.ID,
			Type : 'Lecturer',
			Value : -1
		})
		const {actionNumberRequestCreators} = this.props
		const {actionUpdateNumberRequest} = actionNumberRequestCreators
		actionUpdateNumberRequest({})
		this.setState({
			renderAgain: !this.state.renderAgain
		})
	}
	onOK = (data) =>{
		const {lecturerUpdateRequestCreators} = this.props;
		const {actionUpdateRequestDBForLecturer} = lecturerUpdateRequestCreators;
		actionUpdateRequestDBForLecturer({
			ID : data.ID,
			Type : 'Lecturer',
			Value : -1
		})
		this.setState({
			renderAgain: !this.state.renderAgain
		})
		
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
			  		{
						this.props.data.AcceptByDean === -1 || this.props.data.AcceptByPDT === -1
						? "Bạn da bi tu choi quyen sua diem cot " + this.props.data.OutLine_Name + " - " +
							this.props.data.Course_Name
						: "Yêu cầu sửa điểm " + this.props.data.OutLine_Name + " - " +
						this.props.data.Course_Name + " đã được phê duyệt"
					}
			  </span>
			</td>
			<td>
				<span className="label label-info" onClick={()=>this.getStudent(this.props.data)} data-toggle="modal" data-target="#myModal" >Detail</span>
			</td>
			<td>
				{this.props.data.DateTime}
			</td>
			<td>
				{
					this.props.data.HasUpload === 0 && this.props.data.AcceptByDean !== -1 && this.props.data.AcceptByPDT !== -1
					? <div>
						<button type="button" onClick={()=>this.onSubmitGrade(this.props.data)}className="btn btn-info">Submit</button>
						<button type="button" onClick={()=>this.onCancelSubmitGrade(this.props.data)} className="btn btn-info">Cancel</button>
					</div>

					: (this.props.data.AcceptByDean === -1 && this.props.data.AcceptByPDT === -1 && this.props.data.HasUpload !== -1)

					? <button type="button" id="onOK" onClick={()=>this.onOK(this.props.data)} className="btn btn-info">OK</button>
					
					: this.props.data.HasUpload === '1' || this.props.data.HasUpload === 1
						? "Submitted"
						: "Canceled"
					
				}
			</td>
		  </tr>
	  )
	}
}
const mapStateToProps = state => {
	return {
		//requests : state.getRequest
	};
};
const mapDispatchToProps = dispatch => {
	return {
		acceptRequestCreators : bindActionCreators(acceptRequest, dispatch),
		lecturerRequestUploadGradeCreators : bindActionCreators(lecturerRequestUploadGrade, dispatch),
		lecturerUpdateRequestCreators : bindActionCreators(lecturerUpdateRequest, dispatch),
		actionGetStudentC : bindActionCreators(actionGetStudent, dispatch),
		actionNumberRequestCreators : bindActionCreators(actionNumberRequest, dispatch)
	};
};
export default connect(mapStateToProps, mapDispatchToProps)(TableItem);