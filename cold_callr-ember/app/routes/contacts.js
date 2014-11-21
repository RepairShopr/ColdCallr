import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return this.store.find('contact');
  },

  afterModel: function(contacts, transition) {
    if (contacts.get('length') > 0) {
      this.transitionTo('contacts.show', contacts.get('firstObject'));
    }
  },

  actions: {
    getNext: function(contact){
      var that = this;
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
