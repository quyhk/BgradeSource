import React, { Component } from 'react'
import './footer.css';

export default class Footer extends Component {
    render() {
        return (
            <div className="fix_bottom">
                <div className="footer">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 footer_left">
                        <h2 className="foot_Block">Blockchain 's In Your Area</h2>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 footer_right">
                        <strong>Addess :</strong> 254 Nguyen Van Linh - Da Nang <br />
                        <strong>Contact :</strong> 0964318076
                    </div>
                </div>
                <div>
                    <p className="text-center">Copyright© 2019</p>
                </div>
            </div>
        )
    }
}


