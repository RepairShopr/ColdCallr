import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: 'cold-callr-ember', // TODO: loaded via config
  Resolver: Resolver
});

loadInitializers(App, 'cold-callr-ember');

export default App;
