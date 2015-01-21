import Ember from 'ember';

export default Ember.Component.extend({
  click: function () {
    this.toggleProperty('isShowingMore');
  },
  tagName: "a",
  classNames: ["list-group-item"],
  classNameBindings: ["isShowingMore:open"]
});