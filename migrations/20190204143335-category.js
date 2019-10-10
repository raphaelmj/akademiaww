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
  return db.createTable('category', {
    id: {
      type: 'int',
      primaryKey: true,
      autoIncrement: true,
      unsigned: true
    },
    name:{
      type:'string',
      lenght:255,
      notNull:true
    },
    alias:{
      type:'string',
      lenght:255,
      unique:true,
      notNull:true
    },
    self_link:{
      type:'string'
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
  return db.dropTable('category', callback);
};

exports._meta = {
  "version": 1
};
