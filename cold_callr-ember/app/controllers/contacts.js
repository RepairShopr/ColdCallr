import Ember from 'ember';
import { PaginationControllerMixin } from '../mixins/pagination-base';

export default Ember.ArrayController.extend(PaginationControllerMixin,{
  queryParams: ['sortBy', 'page', 'status', 'query'],
  sortBy: 'createdAt',
  query: '',
  sortAscending: false,
  status: '',
  page: 1,


  setupController: function(controller, model){
    this._super(controller, model);
    controller.setProperties({
      page: this.get('page'),
      status: this.get('status'),
      orderBy: this.get('orderBy')
    });
  },


  total_pages: function(){
    return this.store.metadataFor('contact').total_pages;
  }.property('model'),

  onExpired: function(){
    return this.get("status") === 'expired';
  }.property("model")

});