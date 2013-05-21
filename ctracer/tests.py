# -*- coding: utf-8 -*-
from django.utils import unittest
from ctracer.service import WsdlTracer

class WsdlTest(unittest.TestCase):
    def test_wsdl_connect(self):
        w = WsdlTracer(u'FCIU 8746315')
        clear_data = w.get_wsdl_data()
        w.populate_data(clear_data)                          

                           
 
