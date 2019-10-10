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
  return db.createTable('course', {
    id: {
      type: 'int',
      primaryKey: true,
      autoIncrement: true,
      unsigned: true
    },
    school_id:
      {
        type: 'int',
        unsigned: true,
        notNull:false,
        foreignKey: {
          name: 'course_school_id_fk',
          table: 'school',
          rules: {
            onDelete: 'SET NULL',
            onUpdate: 'RESTRICT'
          },
          mapping: 'id'
        }
      },
    name:{
      type:'string'
    },
    alias:{
      type:'string'
    },
    description:{
      type:'text'
    },
    summary_description:{
      type:'text'
    },
    program_json:{
      type:'text'
    },
    price_json:{
      type:'text'
    },
    self_link:{
      type:'string'
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
  return db.dropTable('course', callback);
};

exports._meta = {
  "version": 1
};
