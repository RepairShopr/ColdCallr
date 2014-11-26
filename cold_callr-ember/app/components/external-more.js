import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    toggleMore: function() {
      this.toggleProperty('isShowingMore');
    }
  }
});