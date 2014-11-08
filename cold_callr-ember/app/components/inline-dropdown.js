import Ember from 'ember';

export default Ember.Component.extend({
  //TODO: setup the options array to have a computed property of 'isSelected' for old value
  isEditing: false,
  tagName: 'span',

  doubleClick: function(){
    this.set('isEditing',true);
    this.set('pastValue', this.get('value'));

  },



  actions: {
    save: function(editor){
      debugger;

      console.log('saving: ' + selectBox.value);
      var model = this.model;
      model.set(this.get("attribute"),selectBox.value);
      model.save();
      this.set('isEditing',false);
    },
    cancel: function(){
      console.log('cancelling');
      this.set('value', this.get('pastValue')) ;
      this.set('isEditing',false);
    }
  }
});