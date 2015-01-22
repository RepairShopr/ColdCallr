import DS from 'ember-data';

export default DS.Transform.extend({
  deserialize: function (serialized) {
    return serialized.split(",").map(function (keyValuePair) {
      return keyValuePair.split(":");
    });
  },
  serialize: function (deserialized) {
    return deserialized.map(function (keyValuePair) {
      return keyValuePair.join(":");
    }).join(",");
  }
});
