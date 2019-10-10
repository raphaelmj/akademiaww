'use strict';

var dbm;
var type;
var seed;

/**
  * We receive the dbmigrate dependency from dbmigrate initially.
  * This enables us to not have to rely on NODE_PATH.
  */
exports.setup = function(options, seedLink) {
  dbm = options.dbmigrate;
  type = dbm.dataType;
  seed = seedLink;
};

exports.up = function(db,callback) {
  return db.createTable('link', {
      id: {
        type: 'int',
        primaryKey: true,
        autoIncrement: true,
        unsigned: true
      },
      link_id:
      {
        type: 'int',
        unsigned: true,
        notNull:false,
        default:'NULL',
        foreignKey: {
          name: 'link_link_id_fk',
          table: 'link',
          rules: {
            onDelete: 'SET NULL',
            onUpdate: 'RESTRICT'
          },
          mapping: 'id'
        }
      },
      content_id:
      {
        type: 'int',
        unsigned: true,
        notNull:false,
        foreignKey: {
          name: 'link_content_id_fk',
          table: 'content',
          rules: {
            onDelete: 'SET NULL',
            onUpdate: 'RESTRICT'
          },
          mapping: 'id'
        }
      },
      course_id:
      {
        type: 'int',
        unsigned: true,
        notNull:false,
        foreignKey: {
          name: 'link_course_id_fk',
          table: 'course',
          rules: {
            onDelete: 'SET NULL',
            onUpdate: 'RESTRICT'
          },
          mapping: 'id'
        }
      },
      category_id:
      {
        type: 'int',
        unsigned: true,
        notNull:false,
        foreignKey: {
          name: 'link_category_id_fk',
          table: 'category',
          rules: {
            onDelete: 'SET NULL',
            onUpdate: 'RESTRICT'
          },
          mapping: 'id'
        }
      },
      school_id:
      {
        type: 'int',
        unsigned: true,
        notNull:false,
        foreignKey: {
          name: 'link_school_id_fk',
          table: 'school',
          rules: {
            onDelete: 'SET NULL',
            onUpdate: 'RESTRICT'
          },
          mapping: 'id'
        }
      },
      title:{
        type:'string',
        length:'255',
        notNull:true
      },
      alias:{
        type:'string',
        length:'255',
        unique:true,
        notNull:true
      },
      path:{
        type:'string',
        length:'500',
        notNull:true
      },
      data_type:{
        type:'string',
        default:'article', //article,course,school,category,course-list,external-link,blank
        notNull:true
      },
      external_link:{
        type:'string'
      },
      params:{
        type:'string'
      },
      status:{
        type:'smallint',
        default:0
      },
      view:{
        type:'string'
      },
      linked_menu:{
        type:'text'
      },
      params:{
        type:'string'
      },
      custom_title:{
        type:'string'
      },
      meta_desc:{
        type:'text'
      },
      meta_keywords:{
        type:'text'
      },
      ordering:{
        type:'int'
      },
      updated_at: {
        type: 'timestamp'
      }
    },
    function(err) {
      if (err) return callback(err);
      return callback();
    });
};

exports.down = function(db,callback) {
  return db.dropTable('link', callback);
};

exports._meta = {
  "version": 1
};
