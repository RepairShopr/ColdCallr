import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  phone: DS.attr(),
  status: DS.attr(),
  doNotCall: DS.attr('boolean'),
  properties: DS.attr(),
  activities: DS.hasMany('activity', {embedded: true})


});
