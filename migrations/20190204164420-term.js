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
  return db.createTable('term',{
    id: {
      type: 'int',
      primaryKey: true,
      autoIncrement: true,
      unsigned: true
    },
    course_id:
    {
      type: 'int',
      unsigned: true,
      notNull:false,
      foreignKey: {
        name: 'term_course_id_fk',
        table: 'course',
        rules: {
          onDelete: 'SET NULL',
          onUpdate: 'RESTRICT'
        },
        mapping: 'id'
      }
    },
    learn_term_id:
    {
      type: 'int',
      unsigned: true,
      notNull:false,
      foreignKey: {
        name: 'term_learn_time_id_fk',
        table: 'learn_time',
        rules: {
          onDelete: 'SET NULL',
          onUpdate: 'RESTRICT'
        },
        mapping: 'id'
      }
    },
    time_type:{
      type:'string',
      default:'inherit' //inherit,custom
    },
    work_type:{
      type:'string',
      default:'group' //group,binary,single
    },
    start_day_at:{
      type:'date'
    },
    end_day_at:{
      type:'date'
    },
    start_time_at:{
      type:'time'
    },
    end_time_at:{
      type:'time'
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
  db.dropTable('term', callback);
};

exports._meta = {
  "version": 1
};
