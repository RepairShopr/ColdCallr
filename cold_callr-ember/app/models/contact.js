import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  phone: DS.attr(),
  doNotCall: DS.attr('boolean'),
  properties: DS.attr()
});
