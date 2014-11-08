import DS from 'ember-data';

export default DS.Model.extend({
  contact: DS.belongsTo('contact'),
  notes: DS.attr('string'),
  userName: DS.attr('string'),
  createdAt: DS.attr()

});
