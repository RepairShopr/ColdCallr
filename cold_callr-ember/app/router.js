import Ember from 'ember';

var Router = Ember.Router.extend({
  location: ColdCallrEmberENV.locationType
});

Router.map(function() {
  this.resource('contact', { path: 'contacts/:contact_id' });
});

export default Router;
