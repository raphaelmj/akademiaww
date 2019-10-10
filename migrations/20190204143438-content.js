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
  return db.createTable('content', {
    id: {
      type: 'int',
      primaryKey: true,
      autoIncrement: true,
      unsigned: true
    },
    category_id:
      {
        type: 'int',
        unsigned: true,
        notNull:false,
        foreignKey: {
          name: 'content_category_id_fk',
          table: 'category',
          rules: {
            onDelete: 'SET NULL',
            onUpdate: 'RESTRICT'
          },
          mapping: 'id'
        }
      },
    title:{
      type:"string",
      lenght:255
    },
    alias:{
      type:"string",
      lenght:255,
      unique:true
    },
    image:{
      type:'string'
    },    
    intro:{
      type:'text'
    },
    content:{
      type:'text'
    },
    self_link:{
      type:'string'
    },
    status:{
      type:'smallint',
      default:0,
      notNull:true
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
  return db.dropTable('content', callback);
};

exports._meta = {
  "version": 1
};
