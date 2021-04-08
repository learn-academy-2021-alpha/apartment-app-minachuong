import React, { Component } from 'react'
import { Button, Card, CardTitle, Col, Row } from 'reactstrap'
import { NavLink } from 'react-router-dom'
import { faHome, faCity, faUser, faEnvelope, faDollarSign, faBed, faToiletPaper, faPaw } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"

class MyApartmentIndex extends Component {
  render() {
    return (
      <>
      <h3>My Apartments</h3>
      <Row className="cards">
          { this.props.myApartments.map(apartment => {
            return (
              <Col sm="4" key={ apartment.id }>
                <div className="my-show-card">
                  <h4>Location</h4>
                  <h5><FontAwesomeIcon icon={ faHome } className="fa-icon" />{ apartment.street }</h5>
                  <h5><FontAwesomeIcon icon={ faCity } className="fa-icon" />{ apartment.city }, { apartment.state }</h5>
                  <br />
                  <h4>Manager Info</h4>
                  <h5><FontAwesomeIcon icon={ faUser } className="fa-icon" />{ apartment.manager }</h5>
                  <h5><FontAwesomeIcon icon={ faEnvelope } className="fa-icon" />{ apartment.email }</h5>
                  <br />
                  <h4>Details</h4>
                  <h5><FontAwesomeIcon icon={ faDollarSign } className="fa-icon" />{ apartment.price } per month</h5>
                  <h5><FontAwesomeIcon icon={ faBed } className="fa-icon" />Bedrooms: { apartment.bedrooms }</h5>
                  <h5><FontAwesomeIcon icon={ faToiletPaper } className="fa-icon" />Bathrooms: { apartment.bathrooms }</h5>
                  <h5><FontAwesomeIcon icon={ faPaw } className="fa-icon" />Pets Allowed: { apartment.pets }</h5>
                    <p className="my-card-button">
                      <NavLink to={`/apartment-edit/${apartment.id}`}>
                        <Button color="secondary">
                          Update Listing
                        </Button>
                      </NavLink>
                      <NavLink to="/myapartments">
                        <Button color="secondary" onClick={ () => this.props.deleteApartment(apartment.id) }>
                          Remove Listing
                        </Button>
                      </NavLink>
                    </p>
                </div>
              </Col>
            )
          })}
      </Row>
      </>
    )
  }
}
export default MyApartmentIndex
