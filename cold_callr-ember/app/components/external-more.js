import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    toggleMore: function () {
      this.toggleProperty('isShowingMore');
    }
  },
  tagName: "li",
  classNames: ["list-group-item"]
});