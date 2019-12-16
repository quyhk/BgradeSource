/* eslint-disable jsx-a11y/anchor-is-valid */
import React, { Component } from 'react';
//import StudentMenu from '../Menu/index.js';
//import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
//import routes from '../../../Routes/Student';
import '../../Css/Content.css';
import './styles.css'
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import * as actionGetAnnounce from '../../../actions/EditGrade/announceForDean'
import NewGif from '../../../assets/new.gif'

import DeanMenu from '../Menu';
import Footer from '../../Header_Footer/footer'

const gif = {
	position: 'static',
    height: '50%'
};

class TableItem extends React.Component {
	render() {
		var date = new Date();
		var curentDay = date.getDate() + '/' + (date.getMonth()+1) + '/' + date.getFullYear()
	  	return (
		<tr className={ this.props.data.DateTime.split(' ')[1] ===  curentDay ? "active_off" : ""}>
			<td>{this.props.stt}</td>
			<td>
			  <span>
					{
						this.props.data.IsFinalTest === null
							? 	"Lecturer " + this.props.data.Lecturer_Name + " - " +
								this.props.data.Dep_Name + " has edited the grade of " + this.props.data.OutLine_Name
								+ " - " + this.props.data.Course_Name
							:   "Acadimic affairs department has edited the grade of "+ this.props.data.OutLine_Name
							+ " - " + this.props.data.Course_Name
					}
					{this.props.data.DateTime.split(' ')[1] ===  curentDay ? 
						<img
							alt='Loding'
							src={NewGif}
							className="gif"
							style={gif}
                		/> : ""}
			  </span>
			</td>
			<td>
				{this.props.data.Reason}
			</td>
			<td>
				{this.props.data.DateTime}
			</td>
		  </tr>
	  )
	}
  }

class DeanHome extends Component {
	constructor(props) {
		super(props);
		this.state = {
			currentPage: 1,
			newsPerPage: 8,
			renderAgain: false
		};
	}
	chosePage = (event) => {
		this.setState({
			currentPage: Number(event.target.id)
		});
	}
	componentDidMount(){
		const {actionGetAnnounceCreators} = this.props;
		const {actionGetAnnounceForDean} = actionGetAnnounceCreators;
		actionGetAnnounceForDean({
			Dean_ID : sessionStorage.getItem('id')
		})
		this.setState({
			renderAgain : !this.state.renderAgain
		})
	}
	

	render() {
		const currentPage = this.state.currentPage;
		const newsPerPage = this.state.newsPerPage;
		const indexOfLastNews = currentPage * newsPerPage;
		const indexOfFirstNews = indexOfLastNews - newsPerPage;
		let renderTodos = null;
		let pageNumbers = []
		if(this.props.announces.length > 0){
			const currentTodos = this.props.announces.slice(indexOfFirstNews, indexOfLastNews);
			renderTodos = currentTodos.map((announce, index) => {
				return (
					<TableItem stt={index + 1 + (currentPage - 1)*newsPerPage} key={index} data={announce} />
				)
			});

			//const pageNumbers = [];
			for (let i = 1; i <= Math.ceil(this.props.announces.length / newsPerPage); i++) {
				pageNumbers.push(i);
			}
		}
		if(renderTodos === null){
			renderTodos = (
				<tr>
					<td colSpan="4">
						No Data
					</td>
				</tr>
			)
		}
		return (
			<div className="">
				<DeanMenu />
				<div className="content container">
					<div className="table-responsive">
						<table className="table table-bordered table-hover">
							<thead>
								<tr>
									<th>No</th>
									<th>Announce</th>
									<th>Reason</th>
									<th>Time</th>
								</tr>
							</thead>
							<tbody>
								{renderTodos}
							</tbody>
						</table>

					</div>

					<div className="pagination-custom">
						<ul id="page-numbers">
							{
								pageNumbers.map(number => {
									if (this.state.currentPage === number) {
										return (
											<li key={number} id={number} className="active">
												{number}
											</li>
										)
									}
									else {
										return (
											<li key={number} id={number} onClick={this.chosePage} >
												{number}
											</li>
										)
									}
								})
							}
						</ul>
					</div>
					<Footer />	
				</div>
			</div>

		);
	}



}

const mapStateToProps = state => {
    return{
		announces : state.getAnnounce
    };
};
const mapDispatchToProps = dispatch => {
    return{
		actionGetAnnounceCreators : bindActionCreators(actionGetAnnounce, dispatch),
    };
};
export default connect(mapStateToProps, mapDispatchToProps)(DeanHome);
