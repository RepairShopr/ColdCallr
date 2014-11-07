import Ember from 'ember';

export default Ember.ArrayController.extend({
  perPage: 100, // override the default and set to 50 per page
  page: 1,
  currentContact: 1,

  filteredContacts: function() {
    var status = "New";
    var contacts = this.get('arrangedContent');

    if (status) {
      return contacts.filterBy('status', status);
    } else {
      return contacts;
    }
  }.property('status', 'model')


});