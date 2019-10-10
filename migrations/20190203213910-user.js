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
  return db.createTable('user', {
    id: {
      type: 'int',
      primaryKey: true,
      autoIncrement: true
    },
    login: {
      type: 'string',
      length: 50
    },
    password: {
      type: 'string',
      length: 500
    },
    status: {
      type: 'smallint'
    },
    updated_at: {
      type: 'timestamp'
    }
  }, function(err) {
    if (err) return callback(err);
    return callback();
  });
};

exports.down = function(db,callback) {
  return db.dropTable('user', callback);
};

exports._meta = {
  "version": 1
};
