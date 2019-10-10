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
  return db.createTable('menu', {
    id: {
      type: 'int',
      primaryKey: true,
      autoIncrement: true,
      unsigned: true
    },
    name: {
      type: 'string',
      length: 100,
      notNull:true
    },
    alias: {
      type: 'string',
      length: 100,
      notNull:true
    },
    level: {
      type: 'int'
    },
    links_json: {
      type: 'longtext'
    },
    // all_link_json: {
    //   type: 'longtext'
    // },
    updated_at: {
      type: 'timestamp'
    }
  }, function(err) {
    if (err) return callback(err);
    return callback();
  });
};

exports.down = function(db,callback) {
  return db.dropTable('menu', callback);
};

exports._meta = {
  "version": 1
};
