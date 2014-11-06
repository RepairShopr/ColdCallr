import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return this.store.find('contact');
  },

  afterModel: function(contacts, transition) {
    if (contacts.get('length') > 0) {
      this.transitionTo('contacts.show', contacts.get('lastObject'));
    }
  },

  actions: {
    getMore: function(){
      if (this.get('loadingMore')) {
        return;
      }

      this.set('loadingMore', true);

      var controller = this.get('controller'),
        nextPage   = controller.get('currentPage') + 1,
        perPage    = controller.get('perPage');


      var page = this.incrementProperty('currentPage');
      controller.set("currentPage",page);

      var model = this.get('store').find('contact', { page: page });

      if (model.get('length') > 0) {
        this.transitionTo('contacts.show', model.get('lastObject'));
      }

      this.set('loadingMore', false);
    }

  }
});
