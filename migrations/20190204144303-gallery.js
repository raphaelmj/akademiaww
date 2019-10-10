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
  return db.createTable('gallery', {
    id: {
      type: 'int',
      primaryKey: true,
      autoIncrement: true,
      unsigned: true
    },
    content_id:
    {
      type: 'int',
      unsigned: true,
      notNull:false,
      foreignKey: {
        name: 'gallery_content_id_fk',
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
        name: 'gallery_course_id_fk',
        table: 'course',
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
    gallery_type:{
      type:'string',
      default:'block', //block,rotor
      notNull:true
    },
    data:{
      type:'text'
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
  return db.dropTable('gallery', callback);
};

exports._meta = {
  "version": 1
};
