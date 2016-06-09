# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'ContPicsStore'
        db.delete_table('ctracer_contpicsstore')

        # Adding model 'MovingChain'
        db.create_table('ctracer_movingchain', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('datein', self.gf('django.db.models.fields.DateField')()),
            ('container_num', self.gf('django.db.models.fields.CharField')(max_length=12)),
        ))
        db.send_create_signal('ctracer', ['MovingChain'])

        # Adding model 'FileStore'
        db.create_table('ctracer_filestore', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('file', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
            ('moving_chain', self.gf('django.db.models.fields.related.ForeignKey')(related_name='files', to=orm['ctracer.MovingChain'])),
        ))
        db.send_create_signal('ctracer', ['FileStore'])


    def backwards(self, orm):
        # Adding model 'ContPicsStore'
        db.create_table('ctracer_contpicsstore', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('container_num', self.gf('django.db.models.fields.CharField')(max_length=12)),
            ('file', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
            ('datein', self.gf('django.db.models.fields.DateField')()),
        ))
        db.send_create_signal('ctracer', ['ContPicsStore'])

        # Deleting model 'MovingChain'
        db.delete_table('ctracer_movingchain')

        # Deleting model 'FileStore'
        db.delete_table('ctracer_filestore')


    models = {
        'cms.cmsplugin': {
            'Meta': {'object_name': 'CMSPlugin'},
            'changed_date': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'creation_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2016, 6, 7, 0, 0)'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language': ('django.db.models.fields.CharField', [], {'max_length': '15', 'db_index': 'True'}),
            'level': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'lft': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'parent': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.CMSPlugin']", 'null': 'True', 'blank': 'True'}),
            'placeholder': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.Placeholder']", 'null': 'True'}),
            'plugin_type': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'}),
            'position': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rght': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'tree_id': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'})
        },
        'cms.placeholder': {
            'Meta': {'object_name': 'Placeholder'},
            'default_width': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slot': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'})
        },
        'ctracer.contpicsmodel': {
            'Meta': {'object_name': 'ContPicsModel', 'db_table': "'cmsplugin_contpicsmodel'", '_ormbases': ['cms.CMSPlugin']},
            'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'})
        },
        'ctracer.ctracercmsplugin': {
            'Meta': {'object_name': 'CTracerCMSPlugin', 'db_table': "'cmsplugin_ctracercmsplugin'", '_ormbases': ['cms.CMSPlugin']},
            'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'}),
            'no_result_msg': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'})
        },
        'ctracer.filestore': {
            'Meta': {'object_name': 'FileStore'},
            'file': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'moving_chain': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'files'", 'to': "orm['ctracer.MovingChain']"})
        },
        'ctracer.movingchain': {
            'Meta': {'object_name': 'MovingChain'},
            'container_num': ('django.db.models.fields.CharField', [], {'max_length': '12'}),
            'datein': ('django.db.models.fields.DateField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['ctracer']