import Ember from 'ember';

export default Ember.ObjectController.extend({
  statusOptions: [ 'New', 'Wrong Number', 'Call Back', 'Closed'],
  sortProperties: ['id:desc'],
  sortedActivities: Ember.computed.sort('model.activities', 'sortProperties'),
  isNexting: true,

  actions: {
    newAdminNote: function(){
      var activity = this.store.createRecord('activity', {
        notes: this.get('newNoteBody'),
        contact: this.get('model')
      });
      activity.save();
      this.set('newNoteBody', '');
    },

    nextClick: function(){
      this.set("isNexting",true);
    },

    getNext: function(){
      return true;
    }
  }

});
