import React, { Component } from 'react';
import '../../Css/Menu.css';
import {Link, Route} from 'react-router-dom';
import './styles.css'
import {connect} from 'react-redux'
import Header from '../../Header_Footer/header'

const MenuLink = ({label, to, activeOnlyWhenExact})=>{
	return (
		<Route path={to} exact={activeOnlyWhenExact} children={({match})=>{
			var active = match ? 'active-link' : '';
			return (
				<li className={`my-li ${active}`}>
			 		<Link to={to}>
					 	{label}
			 		</Link>
			 	</li>
			)
		}}/>
	)
}

class PDTMenu extends Component {
	
	render() {
		const menus = [
			{
				name : <i className="glyphicon glyphicon-home">&nbsp;Home</i>,
				to : '/academic-affairs-department/home',
				exact : true
			},
			{
				name : <i className="glyphicon glyphicon-pencil">&nbsp;InputGrade</i>,
				to : '/academic-affairs-department/input-grade',
				exact : true
			},
			{
				name : <i className="glyphicon glyphicon-eye-open">&nbsp;Transcript</i>,
				to : '/academic-affairs-department/transcript',
				exact : true
			},
			{
				name : 	(<i className="glyphicon glyphicon-inbox">
							&nbsp;Request&nbsp;
							<span className="label numberRequest">{this.props.numberRequest ? this.props.numberRequest : null}</span>

						</i>),
				to : '/academic-affairs-department/request',
				exact : true
			},
			{
				name: <i className="glyphicon glyphicon-log-out">&nbsp;Logout</i>,
				to: '/academic-affairs-department/logout',
				exact : true
			}
		]
		return (
			<div>
			<nav className="navbar navbar-inverse menu_background_color">
				<div className="container">
					<div className="navbar-header">
						<button type="button" className="navbar-toggle" data-toggle="collapse" data-target="#menu">
							<span className="sr-only">Toggle navigation</span>
							<span className="icon-bar"></span>
							<span className="icon-bar"></span>
							<span className="icon-bar"></span>
						</button>
					</div>

					<div className="navbar-collapse  collapse" id="menu">
						<ul className="nav navbar-nav">
							{this.showMenu(menus)}
						</ul>
			
						<div className="navbar-right">
							
						</div>
					</div>
				</div>
			</nav>
			<Header Name={sessionStorage.getItem('name')}/>	 
		</div>
		);
	}

	showMenu = (menus)=>{
		var result = null;
		if(menus.length > 0){
			result = menus.map((menu, index)=>{
				return(
					<MenuLink key={index} 
						label={menu.name} 
						to={menu.to} 
						activeOnlyWhenExact={menu.exact} 
					/>
				)
			})
		}
		return result;
	}
}
const mapStateToProps = state => {
    return{
		numberRequest : state.numberRequest
    };
}
export default connect(mapStateToProps, null)(PDTMenu);


