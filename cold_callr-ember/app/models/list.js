import DS from 'ember-data';

export default DS.Model.extend({
  contact: DS.belongsTo('contact'),
  name: DS.attr('string'),
  enabled: DS.attr('boolean')

});
