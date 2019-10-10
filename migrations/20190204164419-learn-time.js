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
  return db.createTable('learn_time',{
    id: {
      type: 'int',
      primaryKey: true,
      autoIncrement: true,
      unsigned: true
    },
    name:{
      type:'string'
    },
    sign:{
      type:'string',
      default:'rano' //rano,pld,week
    },
    description:{
      type:'text'
    },
    start_time:{
      type:'time'
    },
    end_time:{
      type:'time'
    }
  },
  function(err) {
    if (err) return callback(err);
    return callback();
  });
};

exports.down = function(db,callback) {
  db.dropTable('learn_time', callback);
};

exports._meta = {
  "version": 1
};
