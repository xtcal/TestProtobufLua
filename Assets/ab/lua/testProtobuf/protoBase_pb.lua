-- Generated By protoc-gen-lua Do not Edit
local protobuf = require "protobuf"
module('protoBase_pb')


local localTable = {}
localTable.CORPUS = protobuf.EnumDescriptor()
localTable.CORPUS_UNIVERSAL_ENUM = protobuf.EnumValueDescriptor()
localTable.CORPUS_WEB_ENUM = protobuf.EnumValueDescriptor()
localTable.CORPUS_IMAGES_ENUM = protobuf.EnumValueDescriptor()
localTable.CORPUS_LOCAL_ENUM = protobuf.EnumValueDescriptor()
localTable.CORPUS_NEWS_ENUM = protobuf.EnumValueDescriptor()
localTable.CORPUS_PRODUCTS_ENUM = protobuf.EnumValueDescriptor()
localTable.CORPUS_VIDEO_ENUM = protobuf.EnumValueDescriptor()
localTable.PHONETYPE = protobuf.EnumDescriptor()
localTable.PHONETYPE_MOBILE_ENUM = protobuf.EnumValueDescriptor()
localTable.PHONETYPE_HOME_ENUM = protobuf.EnumValueDescriptor()
localTable.PHONETYPE_WORK_ENUM = protobuf.EnumValueDescriptor()
GIPENDPOINT = protobuf.Descriptor()
localTable.GIPENDPOINT_IP_FIELD = protobuf.FieldDescriptor()
localTable.GIPENDPOINT_PORT_FIELD = protobuf.FieldDescriptor()
GVECTOR3 = protobuf.Descriptor()
localTable.GVECTOR3_X_FIELD = protobuf.FieldDescriptor()
localTable.GVECTOR3_Y_FIELD = protobuf.FieldDescriptor()
localTable.GVECTOR3_Z_FIELD = protobuf.FieldDescriptor()
MESSAGEDATA = protobuf.Descriptor()
localTable.MESSAGEDATA_RET_FIELD = protobuf.FieldDescriptor()
localTable.MESSAGEDATA_DESC_FIELD = protobuf.FieldDescriptor()
localTable.MESSAGEDATA_COM_FIELD = protobuf.FieldDescriptor()
localTable.MESSAGEDATA_TSAK_FIELD = protobuf.FieldDescriptor()
localTable.MESSAGEDATA_DATA_FIELD = protobuf.FieldDescriptor()
PHONENUMBER = protobuf.Descriptor()
localTable.PHONENUMBER_NUMBER_FIELD = protobuf.FieldDescriptor()
localTable.PHONENUMBER_TYPE_FIELD = protobuf.FieldDescriptor()
PERSON = protobuf.Descriptor()
localTable.PERSON_NAME_FIELD = protobuf.FieldDescriptor()
localTable.PERSON_ID_FIELD = protobuf.FieldDescriptor()
localTable.PERSON_EMAIL_FIELD = protobuf.FieldDescriptor()
localTable.PERSON_PHONE_FIELD = protobuf.FieldDescriptor()
ADDRESSBOOK = protobuf.Descriptor()
localTable.ADDRESSBOOK_PERSON_FIELD = protobuf.FieldDescriptor()

UNIVERSAL = 0
WEB = 1
IMAGES = 2
LOCAL = 3
NEWS = 4
PRODUCTS = 5
VIDEO = 6
MOBILE = 0
HOME = 1
WORK = 2

localTable.CORPUS_UNIVERSAL_ENUM.name = "UNIVERSAL"
localTable.CORPUS_UNIVERSAL_ENUM.index = 0
localTable.CORPUS_UNIVERSAL_ENUM.number = 0
localTable.CORPUS_WEB_ENUM.name = "WEB"
localTable.CORPUS_WEB_ENUM.index = 1
localTable.CORPUS_WEB_ENUM.number = 1
localTable.CORPUS_IMAGES_ENUM.name = "IMAGES"
localTable.CORPUS_IMAGES_ENUM.index = 2
localTable.CORPUS_IMAGES_ENUM.number = 2
localTable.CORPUS_LOCAL_ENUM.name = "LOCAL"
localTable.CORPUS_LOCAL_ENUM.index = 3
localTable.CORPUS_LOCAL_ENUM.number = 3
localTable.CORPUS_NEWS_ENUM.name = "NEWS"
localTable.CORPUS_NEWS_ENUM.index = 4
localTable.CORPUS_NEWS_ENUM.number = 4
localTable.CORPUS_PRODUCTS_ENUM.name = "PRODUCTS"
localTable.CORPUS_PRODUCTS_ENUM.index = 5
localTable.CORPUS_PRODUCTS_ENUM.number = 5
localTable.CORPUS_VIDEO_ENUM.name = "VIDEO"
localTable.CORPUS_VIDEO_ENUM.index = 6
localTable.CORPUS_VIDEO_ENUM.number = 6
localTable.CORPUS.name = "Corpus"
localTable.CORPUS.full_name = "protoBase.Corpus"
localTable.CORPUS.values = {localTable.CORPUS_UNIVERSAL_ENUM,localTable.CORPUS_WEB_ENUM,localTable.CORPUS_IMAGES_ENUM,localTable.CORPUS_LOCAL_ENUM,localTable.CORPUS_NEWS_ENUM,localTable.CORPUS_PRODUCTS_ENUM,localTable.CORPUS_VIDEO_ENUM}
localTable.PHONETYPE_MOBILE_ENUM.name = "MOBILE"
localTable.PHONETYPE_MOBILE_ENUM.index = 0
localTable.PHONETYPE_MOBILE_ENUM.number = 0
localTable.PHONETYPE_HOME_ENUM.name = "HOME"
localTable.PHONETYPE_HOME_ENUM.index = 1
localTable.PHONETYPE_HOME_ENUM.number = 1
localTable.PHONETYPE_WORK_ENUM.name = "WORK"
localTable.PHONETYPE_WORK_ENUM.index = 2
localTable.PHONETYPE_WORK_ENUM.number = 2
localTable.PHONETYPE.name = "PhoneType"
localTable.PHONETYPE.full_name = "protoBase.PhoneType"
localTable.PHONETYPE.values = {localTable.PHONETYPE_MOBILE_ENUM,localTable.PHONETYPE_HOME_ENUM,localTable.PHONETYPE_WORK_ENUM}
localTable.GIPENDPOINT_IP_FIELD.name = "Ip"
localTable.GIPENDPOINT_IP_FIELD.full_name = "protoBase.GIPEndPoint.Ip"
localTable.GIPENDPOINT_IP_FIELD.number = 1
localTable.GIPENDPOINT_IP_FIELD.index = 0
localTable.GIPENDPOINT_IP_FIELD.label = 1
localTable.GIPENDPOINT_IP_FIELD.has_default_value = false
localTable.GIPENDPOINT_IP_FIELD.default_value = 0
localTable.GIPENDPOINT_IP_FIELD.type = 5
localTable.GIPENDPOINT_IP_FIELD.cpp_type = 1

localTable.GIPENDPOINT_PORT_FIELD.name = "Port"
localTable.GIPENDPOINT_PORT_FIELD.full_name = "protoBase.GIPEndPoint.Port"
localTable.GIPENDPOINT_PORT_FIELD.number = 2
localTable.GIPENDPOINT_PORT_FIELD.index = 1
localTable.GIPENDPOINT_PORT_FIELD.label = 1
localTable.GIPENDPOINT_PORT_FIELD.has_default_value = false
localTable.GIPENDPOINT_PORT_FIELD.default_value = ""
localTable.GIPENDPOINT_PORT_FIELD.type = 9
localTable.GIPENDPOINT_PORT_FIELD.cpp_type = 9

GIPENDPOINT.name = "GIPEndPoint"
GIPENDPOINT.full_name = "protoBase.GIPEndPoint"
GIPENDPOINT.nested_types = {}
GIPENDPOINT.enum_types = {}
GIPENDPOINT.fields = {localTable.GIPENDPOINT_IP_FIELD, localTable.GIPENDPOINT_PORT_FIELD}
GIPENDPOINT.is_extendable = false
GIPENDPOINT.extensions = {}
localTable.GVECTOR3_X_FIELD.name = "X"
localTable.GVECTOR3_X_FIELD.full_name = "protoBase.GVector3.X"
localTable.GVECTOR3_X_FIELD.number = 1
localTable.GVECTOR3_X_FIELD.index = 0
localTable.GVECTOR3_X_FIELD.label = 1
localTable.GVECTOR3_X_FIELD.has_default_value = false
localTable.GVECTOR3_X_FIELD.default_value = 0
localTable.GVECTOR3_X_FIELD.type = 5
localTable.GVECTOR3_X_FIELD.cpp_type = 1

localTable.GVECTOR3_Y_FIELD.name = "Y"
localTable.GVECTOR3_Y_FIELD.full_name = "protoBase.GVector3.Y"
localTable.GVECTOR3_Y_FIELD.number = 2
localTable.GVECTOR3_Y_FIELD.index = 1
localTable.GVECTOR3_Y_FIELD.label = 1
localTable.GVECTOR3_Y_FIELD.has_default_value = false
localTable.GVECTOR3_Y_FIELD.default_value = 0
localTable.GVECTOR3_Y_FIELD.type = 5
localTable.GVECTOR3_Y_FIELD.cpp_type = 1

localTable.GVECTOR3_Z_FIELD.name = "Z"
localTable.GVECTOR3_Z_FIELD.full_name = "protoBase.GVector3.Z"
localTable.GVECTOR3_Z_FIELD.number = 3
localTable.GVECTOR3_Z_FIELD.index = 2
localTable.GVECTOR3_Z_FIELD.label = 1
localTable.GVECTOR3_Z_FIELD.has_default_value = false
localTable.GVECTOR3_Z_FIELD.default_value = 0
localTable.GVECTOR3_Z_FIELD.type = 5
localTable.GVECTOR3_Z_FIELD.cpp_type = 1

GVECTOR3.name = "GVector3"
GVECTOR3.full_name = "protoBase.GVector3"
GVECTOR3.nested_types = {}
GVECTOR3.enum_types = {}
GVECTOR3.fields = {localTable.GVECTOR3_X_FIELD, localTable.GVECTOR3_Y_FIELD, localTable.GVECTOR3_Z_FIELD}
GVECTOR3.is_extendable = false
GVECTOR3.extensions = {}
localTable.MESSAGEDATA_RET_FIELD.name = "ret"
localTable.MESSAGEDATA_RET_FIELD.full_name = "protoBase.MessageData.ret"
localTable.MESSAGEDATA_RET_FIELD.number = 1
localTable.MESSAGEDATA_RET_FIELD.index = 0
localTable.MESSAGEDATA_RET_FIELD.label = 1
localTable.MESSAGEDATA_RET_FIELD.has_default_value = false
localTable.MESSAGEDATA_RET_FIELD.default_value = 0
localTable.MESSAGEDATA_RET_FIELD.type = 5
localTable.MESSAGEDATA_RET_FIELD.cpp_type = 1

localTable.MESSAGEDATA_DESC_FIELD.name = "desc"
localTable.MESSAGEDATA_DESC_FIELD.full_name = "protoBase.MessageData.desc"
localTable.MESSAGEDATA_DESC_FIELD.number = 2
localTable.MESSAGEDATA_DESC_FIELD.index = 1
localTable.MESSAGEDATA_DESC_FIELD.label = 1
localTable.MESSAGEDATA_DESC_FIELD.has_default_value = false
localTable.MESSAGEDATA_DESC_FIELD.default_value = ""
localTable.MESSAGEDATA_DESC_FIELD.type = 9
localTable.MESSAGEDATA_DESC_FIELD.cpp_type = 9

localTable.MESSAGEDATA_COM_FIELD.name = "com"
localTable.MESSAGEDATA_COM_FIELD.full_name = "protoBase.MessageData.com"
localTable.MESSAGEDATA_COM_FIELD.number = 3
localTable.MESSAGEDATA_COM_FIELD.index = 2
localTable.MESSAGEDATA_COM_FIELD.label = 1
localTable.MESSAGEDATA_COM_FIELD.has_default_value = false
localTable.MESSAGEDATA_COM_FIELD.default_value = 0
localTable.MESSAGEDATA_COM_FIELD.type = 5
localTable.MESSAGEDATA_COM_FIELD.cpp_type = 1

localTable.MESSAGEDATA_TSAK_FIELD.name = "tsak"
localTable.MESSAGEDATA_TSAK_FIELD.full_name = "protoBase.MessageData.tsak"
localTable.MESSAGEDATA_TSAK_FIELD.number = 4
localTable.MESSAGEDATA_TSAK_FIELD.index = 3
localTable.MESSAGEDATA_TSAK_FIELD.label = 1
localTable.MESSAGEDATA_TSAK_FIELD.has_default_value = false
localTable.MESSAGEDATA_TSAK_FIELD.default_value = 0
localTable.MESSAGEDATA_TSAK_FIELD.type = 5
localTable.MESSAGEDATA_TSAK_FIELD.cpp_type = 1

localTable.MESSAGEDATA_DATA_FIELD.name = "data"
localTable.MESSAGEDATA_DATA_FIELD.full_name = "protoBase.MessageData.data"
localTable.MESSAGEDATA_DATA_FIELD.number = 5
localTable.MESSAGEDATA_DATA_FIELD.index = 4
localTable.MESSAGEDATA_DATA_FIELD.label = 1
localTable.MESSAGEDATA_DATA_FIELD.has_default_value = false
localTable.MESSAGEDATA_DATA_FIELD.default_value = ""
localTable.MESSAGEDATA_DATA_FIELD.type = 9
localTable.MESSAGEDATA_DATA_FIELD.cpp_type = 9

MESSAGEDATA.name = "MessageData"
MESSAGEDATA.full_name = "protoBase.MessageData"
MESSAGEDATA.nested_types = {}
MESSAGEDATA.enum_types = {}
MESSAGEDATA.fields = {localTable.MESSAGEDATA_RET_FIELD, localTable.MESSAGEDATA_DESC_FIELD, localTable.MESSAGEDATA_COM_FIELD, localTable.MESSAGEDATA_TSAK_FIELD, localTable.MESSAGEDATA_DATA_FIELD}
MESSAGEDATA.is_extendable = false
MESSAGEDATA.extensions = {}
localTable.PHONENUMBER_NUMBER_FIELD.name = "number"
localTable.PHONENUMBER_NUMBER_FIELD.full_name = "protoBase.PhoneNumber.number"
localTable.PHONENUMBER_NUMBER_FIELD.number = 1
localTable.PHONENUMBER_NUMBER_FIELD.index = 0
localTable.PHONENUMBER_NUMBER_FIELD.label = 2
localTable.PHONENUMBER_NUMBER_FIELD.has_default_value = false
localTable.PHONENUMBER_NUMBER_FIELD.default_value = ""
localTable.PHONENUMBER_NUMBER_FIELD.type = 9
localTable.PHONENUMBER_NUMBER_FIELD.cpp_type = 9

localTable.PHONENUMBER_TYPE_FIELD.name = "type"
localTable.PHONENUMBER_TYPE_FIELD.full_name = "protoBase.PhoneNumber.type"
localTable.PHONENUMBER_TYPE_FIELD.number = 2
localTable.PHONENUMBER_TYPE_FIELD.index = 1
localTable.PHONENUMBER_TYPE_FIELD.label = 1
localTable.PHONENUMBER_TYPE_FIELD.has_default_value = true
localTable.PHONENUMBER_TYPE_FIELD.default_value = HOME
localTable.PHONENUMBER_TYPE_FIELD.enum_type = localTable.PHONETYPE
localTable.PHONENUMBER_TYPE_FIELD.type = 14
localTable.PHONENUMBER_TYPE_FIELD.cpp_type = 8

PHONENUMBER.name = "PhoneNumber"
PHONENUMBER.full_name = "protoBase.PhoneNumber"
PHONENUMBER.nested_types = {}
PHONENUMBER.enum_types = {}
PHONENUMBER.fields = {localTable.PHONENUMBER_NUMBER_FIELD, localTable.PHONENUMBER_TYPE_FIELD}
PHONENUMBER.is_extendable = false
PHONENUMBER.extensions = {}
localTable.PERSON_NAME_FIELD.name = "name"
localTable.PERSON_NAME_FIELD.full_name = "protoBase.Person.name"
localTable.PERSON_NAME_FIELD.number = 1
localTable.PERSON_NAME_FIELD.index = 0
localTable.PERSON_NAME_FIELD.label = 2
localTable.PERSON_NAME_FIELD.has_default_value = false
localTable.PERSON_NAME_FIELD.default_value = ""
localTable.PERSON_NAME_FIELD.type = 9
localTable.PERSON_NAME_FIELD.cpp_type = 9

localTable.PERSON_ID_FIELD.name = "id"
localTable.PERSON_ID_FIELD.full_name = "protoBase.Person.id"
localTable.PERSON_ID_FIELD.number = 2
localTable.PERSON_ID_FIELD.index = 1
localTable.PERSON_ID_FIELD.label = 2
localTable.PERSON_ID_FIELD.has_default_value = false
localTable.PERSON_ID_FIELD.default_value = 0
localTable.PERSON_ID_FIELD.type = 5
localTable.PERSON_ID_FIELD.cpp_type = 1

localTable.PERSON_EMAIL_FIELD.name = "email"
localTable.PERSON_EMAIL_FIELD.full_name = "protoBase.Person.email"
localTable.PERSON_EMAIL_FIELD.number = 3
localTable.PERSON_EMAIL_FIELD.index = 2
localTable.PERSON_EMAIL_FIELD.label = 1
localTable.PERSON_EMAIL_FIELD.has_default_value = false
localTable.PERSON_EMAIL_FIELD.default_value = ""
localTable.PERSON_EMAIL_FIELD.type = 9
localTable.PERSON_EMAIL_FIELD.cpp_type = 9

localTable.PERSON_PHONE_FIELD.name = "phone"
localTable.PERSON_PHONE_FIELD.full_name = "protoBase.Person.phone"
localTable.PERSON_PHONE_FIELD.number = 4
localTable.PERSON_PHONE_FIELD.index = 3
localTable.PERSON_PHONE_FIELD.label = 3
localTable.PERSON_PHONE_FIELD.has_default_value = false
localTable.PERSON_PHONE_FIELD.default_value = {}
localTable.PERSON_PHONE_FIELD.message_type = PHONENUMBER
localTable.PERSON_PHONE_FIELD.type = 11
localTable.PERSON_PHONE_FIELD.cpp_type = 10

PERSON.name = "Person"
PERSON.full_name = "protoBase.Person"
PERSON.nested_types = {}
PERSON.enum_types = {}
PERSON.fields = {localTable.PERSON_NAME_FIELD, localTable.PERSON_ID_FIELD, localTable.PERSON_EMAIL_FIELD, localTable.PERSON_PHONE_FIELD}
PERSON.is_extendable = false
PERSON.extensions = {}
localTable.ADDRESSBOOK_PERSON_FIELD.name = "person"
localTable.ADDRESSBOOK_PERSON_FIELD.full_name = "protoBase.AddressBook.person"
localTable.ADDRESSBOOK_PERSON_FIELD.number = 1
localTable.ADDRESSBOOK_PERSON_FIELD.index = 0
localTable.ADDRESSBOOK_PERSON_FIELD.label = 3
localTable.ADDRESSBOOK_PERSON_FIELD.has_default_value = false
localTable.ADDRESSBOOK_PERSON_FIELD.default_value = {}
localTable.ADDRESSBOOK_PERSON_FIELD.message_type = PERSON
localTable.ADDRESSBOOK_PERSON_FIELD.type = 11
localTable.ADDRESSBOOK_PERSON_FIELD.cpp_type = 10

ADDRESSBOOK.name = "AddressBook"
ADDRESSBOOK.full_name = "protoBase.AddressBook"
ADDRESSBOOK.nested_types = {}
ADDRESSBOOK.enum_types = {}
ADDRESSBOOK.fields = {localTable.ADDRESSBOOK_PERSON_FIELD}
ADDRESSBOOK.is_extendable = false
ADDRESSBOOK.extensions = {}

AddressBook = protobuf.Message(ADDRESSBOOK)
GIPEndPoint = protobuf.Message(GIPENDPOINT)
GVector3 = protobuf.Message(GVECTOR3)
MessageData = protobuf.Message(MESSAGEDATA)
Person = protobuf.Message(PERSON)
PhoneNumber = protobuf.Message(PHONENUMBER)
