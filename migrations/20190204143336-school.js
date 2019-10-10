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
  return db.createTable('school', {
    id: {
      type: 'int',
      primaryKey: true,
      autoIncrement: true,
      unsigned: true
    },
    name:{
      type:'string',
      length:100
    },
    alias:{
      type:'string',
      length:100
    },
    icon:{
      type:'string'
    },
    description:{
      type:'text'
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
  return db.dropTable('school', callback);
};

exports._meta = {
  "version": 1
};
