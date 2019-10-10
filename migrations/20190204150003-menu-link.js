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
  return db.createTable('menu_links',{
    links_id:
      {
        type: 'int',
        unsigned: true,
        foreignKey: {
          name: 'menu_links_links_id_fk',
          table: 'link',
          rules: {
            onDelete: 'CASCADE',
            onUpdate: 'RESTRICT'
          },
          mapping: 'id'
        }
      },
    menu_id:
      {
        type: 'int',
        unsigned: true,
        foreignKey: {
          name: 'menu_links_menu_id_fk',
          table: 'menu',
          rules: {
            onDelete: 'CASCADE',
            onUpdate: 'RESTRICT'
          },
          mapping: 'id'
        }
      },  
    why:{
      type:'string'
    }  
  })
};

exports.down = function(db,callback) {
  db.dropTable('link_menus', callback);
};

exports._meta = {
  "version": 1
};
