// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"
//
//
//
// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

import React from 'react'
import ReactDOM from 'react-dom'

import Cable from '../components/cable'

window.App = {};
import ActionCable from 'actioncable'
(function() {
    window.App.cable = ActionCable.createConsumer("ws://localhost:8080/cable");
}).call(this);


document.addEventListener("DOMContentLoaded", function(){
    console.log('Hello world');
    ReactDOM.render(
        <Cable/>,
        document.getElementById('root')
    );
});


