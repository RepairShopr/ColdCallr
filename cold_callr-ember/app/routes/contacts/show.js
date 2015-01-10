import Ember from 'ember';

export default Ember.Route.extend({

  model: function(params) {
    return this.store.find('contact', params.contact_id);
  },


  actions: {
    getNext: function(contact,status){
      var that = this;
      contact.set("status",status);
      contact.save();

      var contactPromise = this.store.find('contact', {current_contact: contact.id, per_page: 1});
      contactPromise.then(function() {
        console.log("in the promise then");
        console.log("length is" + contactPromise.get('length'));
        that.controller.set('previousId',contact.id);
        that.transitionTo("contacts.show", contactPromise.content.content[0].id);
      })

    }
  }


});
