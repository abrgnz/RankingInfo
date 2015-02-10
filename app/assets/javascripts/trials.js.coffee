# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->


  $('#calendar').fullCalendar
    eventSources: [{
      url: '/trials_expire',
      color: 'red',
      textColor: 'white',
    },
    {
      url: '/trials_non_expire',
      color: 'blue',
      textColor: 'white',
    }]


    #Coocon
  $("#generic_images a.add_fields").
    data("association-insertion-method", 'append').
    data("association-insertion-node", '#image_fields');


  $("#promotions a.add_fields").
    data("association-insertion-method", 'append').
    data("association-insertion-node", '#promotion_fields');

  $("#notifications a.add_fields").
    data("association-insertion-method", 'append').
    data("association-insertion-node", '#notification_fields');



  $('#calendar').fullCalendar
    eventSources: [{
      url: '/trials_expire',
      color: 'red',
      textColor: 'white',
    },
    {
      url: '/trials_non_expire',
      color: 'blue',
      textColor: 'white',
    }]
