import React,{Component} from 'react';
import './styles.css';
import {Redirect} from 'react-router-dom';
import * as apiLogin from '../../apis/login';
import * as toastify from '../../commons/toastify';
import {connect} from 'react-redux';
//import {bindActionCreators} from 'redux';
//import * as actionLogin from '../../actions/login'

class Login extends Component {
    constructor(props){
		super(props);
		this.state = {
            txtUsername : '',
            txtPassword : '',
            type : ''
        }
    }

    onChange = (e)=>{
		var target = e.target;
		var name = target.name;
		var value = target.value;
		this.setState({
			[name] : value
		})
    }
    
    onLogin = (e)=>{
        e.preventDefault();
        
        const account = {
            "username" : this.state.txtUsername,
            "password" : this.state.txtPassword
        }
        apiLogin
            .login(account)
            .then(res => {
                //console.log(res.data, res.data.message)
                if(res.data.message !== 'NotFound'){
                    sessionStorage.setItem('isLogin', 'true');
                    sessionStorage.setItem('user', res.data.message);
                    sessionStorage.setItem('id', res.data.id);
                    sessionStorage.setItem('name', res.data.Name)
                    if(res.data.walletAddress){
                        sessionStorage.setItem('address', res.data.walletAddress)
                    }
                    this.setState({
                        type : res.data.message
                    })
                    toastify.toastifySuceess('Login successfully');
            
                }else{
                    toastify.toastifyError('Login fail');
                }
            })
            .catch(error => {
                toastify.toastifyError(error.message);
            }
        )
	}
    render() {
        if(sessionStorage.getItem('isLogin') === 'true' && sessionStorage.getItem('user') === 'Student'){
            var {location} = this.props;
			return <Redirect to={{
				pathname : '/student/home',
				state : {
					from : location
				}
            }}/>
        }
        if(sessionStorage.getItem('isLogin') === 'true' && sessionStorage.getItem('user') === 'Lecturer'){
            var {location1} = this.props;
			return <Redirect to={{
				pathname : '/lecturer/home',
				state : {
					from : location1
				}
            }}/>
        }
        if(sessionStorage.getItem('isLogin') === 'true' && sessionStorage.getItem('user') === 'Dean'){
            var {location2} = this.props;
			return <Redirect to={{
				pathname : '/dean/home',
				state : {
					from : location2
				}
            }}/>
        }
        if(sessionStorage.getItem('isLogin') === 'true' && sessionStorage.getItem('user') === 'AAD'){
            var {location3} = this.props;
			return <Redirect to={{
				pathname : '/academic-affairs-department/home',
				state : {
					from : location3
				}
            }}/>
        }
        if(sessionStorage.getItem('isLogin') === 'true' && sessionStorage.getItem('user') === 'ADMIN'){
            var {location4} = this.props;
            return <Redirect to={{
                pathname : '/admin/home',
                state : {
                    from : location4
                }
            }}/>
        }
        return (
            <div className='container'>
                {/* margin left */}
                <div className="col-xs-0 col-sm-1 col-md-2 col-lg-3"></div>
                { /* center body */}
                <div className="col-xs-12 col-sm-10 col-md-8 col-lg-6">
                    <div className="panel panel-primary panel-login">
                        <div className="panel-heading">
                            <h3 className="panel-title">B-Grade</h3>
                        </div>
                        <div className="panel-body">
                            <form onSubmit={this.onLogin} className="form-horizontal" >
                                <div className="col-xs-0 col-sm-1 col-md-1 col-lg-1"></div>
                                <div className="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                                    <div className="form-group"> 
                                        <input onChange={this.onChange} type="text" name="txtUsername" className="form-control" required="required" placeholder='Username' /> 
                                    </div>
                                    <div className="form-group">
                                        <input onChange={this.onChange} type="password" name="txtPassword" className="form-control" required="required" placeholder='Password' />
                                    </div>
                                    <div className="form-group">
                                        <button type="submit" className="btn btn-danger btn-login">Login</button>
                                    </div>
                                </div>
                                <div className="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
                            </form>
                        </div>
                    </div>
                </div>
                { /* margin right */}
                <div className="col-xs-0 col-sm-1 col-md-2 col-lg-3 btn-login"></div>
            </div>
        );
    }
}
const mapDispatchToProps = dispatch => {
	return {
		//actionLoginC : bindActionCreators(actionLogin, dispatch),
	};
};
export default connect(null, mapDispatchToProps)(Login);
