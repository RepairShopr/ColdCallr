import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  phone: DS.attr(),
  city: DS.attr(),
  state: DS.attr(),
  status: DS.attr(),
  doNotCall: DS.attr('boolean'),
  formattedProperties: DS.attr(),
  activities: DS.hasMany('activity', {embedded: true}),

  externalContacts: DS.hasMany('external-contact', {async: true}),

  phoneLink: function() {
    return 'http://repairshopr.mytalkdesk.com/#call/' + this.get('phone');
  }.property('phone'),

  formattedCityState: function() {
    var city = this.get("city");
    var state = this.get("state");
    if(city.length > 0){
      return city + ", " + state;
    }
    else{
      return state;
    }
  }.property('city'),

  lastAddedNote: function() {
    var noteBody = "";
    this.get('activities').forEach(function(activity) {
      noteBody += activity.get('notes');
    });
    return noteBody;
  }.property('activities.@each')


});
