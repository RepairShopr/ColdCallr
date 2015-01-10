import Ember from 'ember';

export var PaginationControllerMixin =  Ember.Mixin.create({
  queryParams: ['page'],
  page: 1,

  hasPreviousPage: function(){
    return this.get('page') > 1;
  }.property('page'),

  hasNextPage: function(){
    return (this.get('page')) < this.get('total_pages');
  }.property('page', 'total_pages'),


  actions: {

    previousPage: function () {
      this.transitionToRoute({
        queryParams: {
          page: this.decrementProperty('page')
        }
      });
    },


    nextPage: function () {
      this.transitionToRoute({
        queryParams: {
          page: this.incrementProperty('page')
        }
      });
    }

  }
});

export var PaginationRouteMixin =  Ember.Mixin.create({
  queryParams: {
    page: {
      refreshModel: true
    }
  }
});