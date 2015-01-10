// ember/app/adapters/application.js
import DS from 'ember-data';
import config from '../config/environment';

export default DS.ActiveModelAdapter.extend({
  host: config.host,
  namespace: 'api',
  coalesceFindRequests: true
});

DS.ActiveModelAdapter.reopen({
  coalesceFindRequests: true
});
