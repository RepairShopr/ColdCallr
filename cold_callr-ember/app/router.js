import Ember from 'ember';

var Router = Ember.Router.extend({
  location: ColdCallrEmberENV.locationType
});

Router.map(function() {
  this.resource('contacts', function(){
    this.route('show', {path: ':contact_id'});
  });
  this.resource('activities', function() { });
});

export default Router;
