(self.webpackChunksrc_htmlphone=self.webpackChunksrc_htmlphone||[]).push([[4304],{4304:function(__unused_webpack_module,__webpack_exports__,__webpack_require__){"use strict";eval('// ESM COMPAT FLAG\n__webpack_require__.r(__webpack_exports__);\n\n// EXPORTS\n__webpack_require__.d(__webpack_exports__, {\n  "default": function() { return /* binding */ Contact; }\n});\n\n;// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/contacts/Contact.vue?vue&type=template&id=27ab5968&scoped=true&\nvar render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c(\'div\',{staticClass:"phone_app",staticStyle:{"width":"326px","height":"743px"}},[_c(\'PhoneTitle\',{attrs:{"title":_vm.IntlString(\'APP_CONTACT_NEW\')},on:{"back":_vm.forceCancel}}),_vm._v(" "),_c(\'div\',{staticClass:"content inputText"},[_c(\'div\',{staticClass:"group select",attrs:{"data-type":"text","data-model":"display","data-maxlength":"64"}},[_c(\'input\',{directives:[{name:"model",rawName:"v-model",value:(_vm.contact.display),expression:"contact.display"},{name:"autofocus",rawName:"v-autofocus"}],attrs:{"id":"contact-display","type":"text","maxlength":"64"},domProps:{"value":(_vm.contact.display)},on:{"input":function($event){if($event.target.composing){ return; }_vm.$set(_vm.contact, "display", $event.target.value)}}}),_vm._v(" "),_c(\'span\',{staticClass:"highlight"}),_vm._v(" "),_c(\'span\',{staticClass:"bar"}),_vm._v(" "),_c(\'label\',{attrs:{"for":"contact-display"}},[_vm._v(_vm._s(_vm.IntlString(\'APP_CONTACT_LABEL_NAME\')))])]),_vm._v(" "),_c(\'div\',{staticClass:"group inputText",attrs:{"data-type":"text","data-model":"number","data-maxlength":"10"}},[_c(\'input\',{directives:[{name:"model",rawName:"v-model",value:(_vm.contact.number),expression:"contact.number"}],attrs:{"id":"contact-number","type":"text","maxlength":"10"},domProps:{"value":(_vm.contact.number)},on:{"input":function($event){if($event.target.composing){ return; }_vm.$set(_vm.contact, "number", $event.target.value)}}}),_vm._v(" "),_c(\'span\',{staticClass:"highlight"}),_vm._v(" "),_c(\'span\',{staticClass:"bar"}),_vm._v(" "),_c(\'label\',{attrs:{"for":"contact-number"}},[_vm._v(_vm._s(_vm.IntlString(\'APP_CONTACT_LABEL_NUMBER\')))])]),_vm._v(" "),_c(\'div\',{staticClass:"group ",staticStyle:{"margin-top":"23px","width":"263px","margin-left":"23px"},attrs:{"data-type":"button","data-action":"save"},on:{"click":function($event){$event.stopPropagation();return _vm.save($event)}}},[_c(\'input\',{staticClass:"btn btn-green",staticStyle:{"font-weight":"100"},attrs:{"type":"button","value":_vm.IntlString(\'APP_CONTACT_SAVE\')},on:{"click":function($event){$event.stopPropagation();return _vm.save($event)}}})]),_vm._v(" "),_c(\'div\',{staticClass:"group",staticStyle:{"margin-top":"23px","width":"263px","margin-left":"23px"},attrs:{"data-type":"button","data-action":"cancel"},on:{"click":function($event){$event.stopPropagation();return _vm.forceCancel($event)}}},[_c(\'input\',{staticClass:"btn btn-orange",staticStyle:{"font-weight":"100"},attrs:{"type":"button","value":_vm.IntlString(\'APP_CONTACT_CANCEL\')},on:{"click":function($event){$event.stopPropagation();return _vm.forceCancel($event)}}})]),_vm._v(" "),_c(\'div\',{staticClass:"group",staticStyle:{"margin-top":"23px","width":"263px","margin-left":"23px"},attrs:{"data-type":"button","data-action":"deleteC"},on:{"click":function($event){$event.stopPropagation();return _vm.deleteC($event)}}},[_c(\'input\',{staticClass:"btn btn-red",staticStyle:{"font-weight":"100"},attrs:{"type":"button","value":_vm.IntlString(\'APP_CONTACT_DELETE\')},on:{"click":function($event){$event.stopPropagation();return _vm.deleteC($event)}}})])])],1)}\nvar staticRenderFns = []\n\n\n// EXTERNAL MODULE: ./node_modules/@babel/runtime/helpers/esm/defineProperty.js\nvar defineProperty = __webpack_require__(6156);\n// EXTERNAL MODULE: ./node_modules/vuex/dist/vuex.esm.js\nvar vuex_esm = __webpack_require__(629);\n// EXTERNAL MODULE: ./src/components/PhoneTitle.vue + 3 modules\nvar PhoneTitle = __webpack_require__(5317);\n// EXTERNAL MODULE: ./src/components/Modal/index.js + 8 modules\nvar Modal = __webpack_require__(4410);\n;// CONCATENATED MODULE: ./node_modules/babel-loader/lib/index.js!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/contacts/Contact.vue?vue&type=script&lang=js&\n\n\nfunction ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }\n\nfunction _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { (0,defineProperty/* default */.Z)(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }\n\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n\n\n\n/* harmony default export */ var Contactvue_type_script_lang_js_ = ({\n  components: {\n    PhoneTitle: PhoneTitle/* default */.Z\n  },\n  data: function data() {\n    return {\n      id: -1,\n      currentSelect: 0,\n      ignoreControls: false,\n      contact: {\n        display: \'\',\n        number: \'\',\n        id: -1\n      }\n    };\n  },\n  computed: _objectSpread({}, (0,vuex_esm/* mapGetters */.Se)([\'IntlString\', \'contacts\', \'useMouse\'])),\n  created: function created() {\n    var _this = this;\n\n    if (!this.useMouse) {\n      this.$bus.$on(\'keyUpArrowDown\', this.onDown);\n      this.$bus.$on(\'keyUpArrowUp\', this.onUp);\n      this.$bus.$on(\'keyUpEnter\', this.onEnter);\n    } else {\n      this.currentSelect = -1;\n    }\n\n    this.$bus.$on(\'keyUpBackspace\', this.cancel);\n    this.id = parseInt(this.$route.params.id);\n    this.contact.number = this.$route.params.number;\n\n    if (this.id !== -1) {\n      var c = this.contacts.find(function (e) {\n        return e.id === _this.id;\n      });\n\n      if (c !== undefined) {\n        this.contact = {\n          id: c.id,\n          display: c.display,\n          number: c.number\n        };\n      }\n    }\n  },\n  beforeDestroy: function beforeDestroy() {\n    this.$bus.$off(\'keyUpArrowDown\', this.onDown);\n    this.$bus.$off(\'keyUpArrowUp\', this.onUp);\n    this.$bus.$off(\'keyUpEnter\', this.onEnter);\n    this.$bus.$off(\'keyUpBackspace\', this.cancel);\n  },\n  methods: _objectSpread(_objectSpread({}, (0,vuex_esm/* mapActions */.nv)([\'updateContact\', \'addContact\'])), {}, {\n    onUp: function onUp() {\n      if (this.ignoreControls === true) return;\n      var select = document.querySelector(\'.group.select\');\n\n      if (select.previousElementSibling !== null) {\n        document.querySelectorAll(\'.group\').forEach(function (elem) {\n          elem.classList.remove(\'select\');\n        });\n        select.previousElementSibling.classList.add(\'select\');\n        var i = select.previousElementSibling.querySelector(\'input\');\n\n        if (i !== null) {\n          i.focus();\n        }\n      }\n    },\n    onDown: function onDown() {\n      if (this.ignoreControls === true) return;\n      var select = document.querySelector(\'.group.select\');\n\n      if (select.nextElementSibling !== null) {\n        document.querySelectorAll(\'.group\').forEach(function (elem) {\n          elem.classList.remove(\'select\');\n        });\n        select.nextElementSibling.classList.add(\'select\');\n        var i = select.nextElementSibling.querySelector(\'input\');\n\n        if (i !== null) {\n          i.focus();\n        }\n      }\n    },\n    onEnter: function onEnter() {\n      var _this2 = this;\n\n      if (this.ignoreControls === true) return;\n      var select = document.querySelector(\'.group.select\');\n\n      if (select.dataset.type === \'text\') {\n        var options = {\n          limit: parseInt(select.dataset.maxlength) || 64,\n          text: this.contact[select.dataset.model] || \'\'\n        };\n        this.$phoneAPI.getReponseText(options).then(function (data) {\n          _this2.contact[select.dataset.model] = data.text;\n        });\n      }\n\n      if (select.dataset.action && this[select.dataset.action]) {\n        this[select.dataset.action]();\n      }\n    },\n    save: function save() {\n      if (this.id === -1 || this.id === 0) {\n        this.addContact({\n          display: this.contact.display,\n          number: this.contact.number\n        });\n      } else {\n        this.updateContact({\n          id: this.id,\n          display: this.contact.display,\n          number: this.contact.number\n        });\n      }\n\n      history.back();\n    },\n    cancel: function cancel() {\n      if (this.ignoreControls === true) return;\n      if (this.useMouse === true && document.activeElement.tagName !== \'BODY\') return;\n      history.back();\n    },\n    forceCancel: function forceCancel() {\n      history.back();\n    },\n    deleteC: function deleteC() {\n      var _this3 = this;\n\n      if (this.id !== -1) {\n        this.ignoreControls = true;\n        var choix = [{\n          title: \'Annuler\'\n        }, {\n          title: \'Annuler\'\n        }, {\n          title: \'Supprimer\',\n          color: \'red\'\n        }, {\n          title: \'Annuler\'\n        }, {\n          title: \'Annuler\'\n        }];\n        Modal/* default.CreateModal */.Z.CreateModal({\n          choix: choix\n        }).then(function (reponse) {\n          _this3.ignoreControls = false;\n\n          if (reponse.title === \'Supprimer\') {\n            _this3.$phoneAPI.deleteContact(_this3.id);\n\n            history.back();\n          }\n        });\n      } else {\n        history.back();\n      }\n    }\n  })\n});\n;// CONCATENATED MODULE: ./src/components/contacts/Contact.vue?vue&type=script&lang=js&\n /* harmony default export */ var contacts_Contactvue_type_script_lang_js_ = (Contactvue_type_script_lang_js_); \n// EXTERNAL MODULE: ./node_modules/vue-loader/lib/runtime/componentNormalizer.js\nvar componentNormalizer = __webpack_require__(1900);\n;// CONCATENATED MODULE: ./src/components/contacts/Contact.vue\n\n\n\n;\n\n\n/* normalize component */\n\nvar component = (0,componentNormalizer/* default */.Z)(\n  contacts_Contactvue_type_script_lang_js_,\n  render,\n  staticRenderFns,\n  false,\n  null,\n  "27ab5968",\n  null\n  \n)\n\n/* harmony default export */ var Contact = (component.exports);//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly9zcmNfaHRtbHBob25lLy4vc3JjL2NvbXBvbmVudHMvY29udGFjdHMvQ29udGFjdC52dWU/ZDE0ZSIsIndlYnBhY2s6Ly9zcmNfaHRtbHBob25lL3NyYy9jb21wb25lbnRzL2NvbnRhY3RzL0NvbnRhY3QudnVlP2YzYmIiLCJ3ZWJwYWNrOi8vc3JjX2h0bWxwaG9uZS8uL3NyYy9jb21wb25lbnRzL2NvbnRhY3RzL0NvbnRhY3QudnVlPzJiMWIiLCJ3ZWJwYWNrOi8vc3JjX2h0bWxwaG9uZS8uL3NyYy9jb21wb25lbnRzL2NvbnRhY3RzL0NvbnRhY3QudnVlPzJlY2EiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7O0FBQUEsMEJBQTBCLGFBQWEsMEJBQTBCLHdCQUF3QixpQkFBaUIscUNBQXFDLGtDQUFrQyxtQkFBbUIsT0FBTywwQ0FBMEMsS0FBSyx3QkFBd0Isd0JBQXdCLGdDQUFnQyxZQUFZLGtDQUFrQyxpRUFBaUUsY0FBYyxhQUFhLHdGQUF3RixFQUFFLHVDQUF1QyxTQUFTLHNEQUFzRCxXQUFXLDhCQUE4QixLQUFLLHlCQUF5Qiw0QkFBNEIsUUFBUSxFQUFFLHdEQUF3RCx5QkFBeUIsd0JBQXdCLHlCQUF5QixrQkFBa0IsMEJBQTBCLE9BQU8seUJBQXlCLHFGQUFxRixxQ0FBcUMsZ0VBQWdFLGNBQWMsYUFBYSxzRkFBc0YsU0FBUyxxREFBcUQsV0FBVyw2QkFBNkIsS0FBSyx5QkFBeUIsNEJBQTRCLFFBQVEsRUFBRSx1REFBdUQseUJBQXlCLHdCQUF3Qix5QkFBeUIsa0JBQWtCLDBCQUEwQixPQUFPLHdCQUF3Qix1RkFBdUYsa0NBQWtDLHlEQUF5RCxRQUFRLDBDQUEwQyxLQUFLLHlCQUF5Qix5QkFBeUIsMEJBQTBCLGNBQWMseUNBQXlDLG9CQUFvQixRQUFRLDJEQUEyRCxLQUFLLHlCQUF5Qix5QkFBeUIsMEJBQTBCLDBCQUEwQixpQ0FBaUMseURBQXlELFFBQVEsNENBQTRDLEtBQUsseUJBQXlCLHlCQUF5QixpQ0FBaUMsY0FBYywwQ0FBMEMsb0JBQW9CLFFBQVEsNkRBQTZELEtBQUsseUJBQXlCLHlCQUF5QixpQ0FBaUMsMEJBQTBCLGlDQUFpQyx5REFBeUQsUUFBUSw2Q0FBNkMsS0FBSyx5QkFBeUIseUJBQXlCLDZCQUE2QixjQUFjLHVDQUF1QyxvQkFBb0IsUUFBUSw2REFBNkQsS0FBSyx5QkFBeUIseUJBQXlCLDZCQUE2QjtBQUM1a0c7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztBQzZGQTtBQUNBO0FBQ0E7QUFFQTtBQUNBO0FBQ0E7QUFEQSxHQURBO0FBSUEsTUFKQSxrQkFJQTtBQUNBO0FBQ0EsWUFEQTtBQUVBLHNCQUZBO0FBR0EsMkJBSEE7QUFJQTtBQUNBLG1CQURBO0FBRUEsa0JBRkE7QUFHQTtBQUhBO0FBSkE7QUFVQSxHQWZBO0FBZ0JBLDhCQUNBLHVFQURBLENBaEJBO0FBbUJBLFNBbkJBLHFCQW1CQTtBQUFBOztBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FKQSxNQUlBO0FBQ0E7QUFDQTs7QUFDQTtBQUNBO0FBQ0E7O0FBQ0E7QUFDQTtBQUFBO0FBQUE7O0FBQ0E7QUFDQTtBQUNBLGtCQURBO0FBRUEsNEJBRkE7QUFHQTtBQUhBO0FBS0E7QUFDQTtBQUNBLEdBeENBO0FBeUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxHQTlDQTtBQStDQSwyQ0FDQSxnRUFEQTtBQUVBLFFBRkEsa0JBRUE7QUFDQTtBQUNBOztBQUNBO0FBQ0E7QUFDQTtBQUNBLFNBRkE7QUFHQTtBQUNBOztBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FmQTtBQWdCQSxVQWhCQSxvQkFnQkE7QUFDQTtBQUNBOztBQUNBO0FBQ0E7QUFDQTtBQUNBLFNBRkE7QUFHQTtBQUNBOztBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0E3QkE7QUE4QkEsV0E5QkEscUJBOEJBO0FBQUE7O0FBQ0E7QUFDQTs7QUFDQTtBQUNBO0FBQ0EseURBREE7QUFFQTtBQUZBO0FBSUE7QUFDQTtBQUNBLFNBRkE7QUFHQTs7QUFDQTtBQUNBO0FBQ0E7QUFDQSxLQTdDQTtBQThDQSxRQTlDQSxrQkE4Q0E7QUFDQTtBQUNBO0FBQ0EsdUNBREE7QUFFQTtBQUZBO0FBSUEsT0FMQSxNQUtBO0FBQ0E7QUFDQSxxQkFEQTtBQUVBLHVDQUZBO0FBR0E7QUFIQTtBQUtBOztBQUNBO0FBQ0EsS0E1REE7QUE2REEsVUE3REEsb0JBNkRBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FqRUE7QUFrRUEsZUFsRUEseUJBa0VBO0FBQ0E7QUFDQSxLQXBFQTtBQXFFQSxXQXJFQSxxQkFxRUE7QUFBQTs7QUFDQTtBQUNBO0FBQ0E7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQ0EsUUFBUTtBQUFSO0FBQUE7QUFDQTs7QUFDQTtBQUNBOztBQUNBO0FBQ0E7QUFDQSxTQU5BO0FBT0EsT0FWQSxNQVVBO0FBQ0E7QUFDQTtBQUNBO0FBbkZBO0FBL0NBLEc7O0FDbEc2SyxDQUFDLDZFQUFlLCtCQUFHLEVBQUMsQzs7OztBQ0EvRjtBQUN2QztBQUNMO0FBQ3RELENBQTJGOzs7QUFHM0Y7QUFDNkY7QUFDN0YsZ0JBQWdCLHNDQUFVO0FBQzFCLEVBQUUsd0NBQU07QUFDUixFQUFFLE1BQU07QUFDUixFQUFFLGVBQWU7QUFDakI7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7O0FBRUEsNENBQWUsaUIiLCJmaWxlIjoiNDMwNC5qcyIsInNvdXJjZXNDb250ZW50IjpbInZhciByZW5kZXIgPSBmdW5jdGlvbiAoKSB7dmFyIF92bT10aGlzO3ZhciBfaD1fdm0uJGNyZWF0ZUVsZW1lbnQ7dmFyIF9jPV92bS5fc2VsZi5fY3x8X2g7cmV0dXJuIF9jKCdkaXYnLHtzdGF0aWNDbGFzczpcInBob25lX2FwcFwiLHN0YXRpY1N0eWxlOntcIndpZHRoXCI6XCIzMjZweFwiLFwiaGVpZ2h0XCI6XCI3NDNweFwifX0sW19jKCdQaG9uZVRpdGxlJyx7YXR0cnM6e1widGl0bGVcIjpfdm0uSW50bFN0cmluZygnQVBQX0NPTlRBQ1RfTkVXJyl9LG9uOntcImJhY2tcIjpfdm0uZm9yY2VDYW5jZWx9fSksX3ZtLl92KFwiIFwiKSxfYygnZGl2Jyx7c3RhdGljQ2xhc3M6XCJjb250ZW50IGlucHV0VGV4dFwifSxbX2MoJ2Rpdicse3N0YXRpY0NsYXNzOlwiZ3JvdXAgc2VsZWN0XCIsYXR0cnM6e1wiZGF0YS10eXBlXCI6XCJ0ZXh0XCIsXCJkYXRhLW1vZGVsXCI6XCJkaXNwbGF5XCIsXCJkYXRhLW1heGxlbmd0aFwiOlwiNjRcIn19LFtfYygnaW5wdXQnLHtkaXJlY3RpdmVzOlt7bmFtZTpcIm1vZGVsXCIscmF3TmFtZTpcInYtbW9kZWxcIix2YWx1ZTooX3ZtLmNvbnRhY3QuZGlzcGxheSksZXhwcmVzc2lvbjpcImNvbnRhY3QuZGlzcGxheVwifSx7bmFtZTpcImF1dG9mb2N1c1wiLHJhd05hbWU6XCJ2LWF1dG9mb2N1c1wifV0sYXR0cnM6e1wiaWRcIjpcImNvbnRhY3QtZGlzcGxheVwiLFwidHlwZVwiOlwidGV4dFwiLFwibWF4bGVuZ3RoXCI6XCI2NFwifSxkb21Qcm9wczp7XCJ2YWx1ZVwiOihfdm0uY29udGFjdC5kaXNwbGF5KX0sb246e1wiaW5wdXRcIjpmdW5jdGlvbigkZXZlbnQpe2lmKCRldmVudC50YXJnZXQuY29tcG9zaW5nKXsgcmV0dXJuOyB9X3ZtLiRzZXQoX3ZtLmNvbnRhY3QsIFwiZGlzcGxheVwiLCAkZXZlbnQudGFyZ2V0LnZhbHVlKX19fSksX3ZtLl92KFwiIFwiKSxfYygnc3Bhbicse3N0YXRpY0NsYXNzOlwiaGlnaGxpZ2h0XCJ9KSxfdm0uX3YoXCIgXCIpLF9jKCdzcGFuJyx7c3RhdGljQ2xhc3M6XCJiYXJcIn0pLF92bS5fdihcIiBcIiksX2MoJ2xhYmVsJyx7YXR0cnM6e1wiZm9yXCI6XCJjb250YWN0LWRpc3BsYXlcIn19LFtfdm0uX3YoX3ZtLl9zKF92bS5JbnRsU3RyaW5nKCdBUFBfQ09OVEFDVF9MQUJFTF9OQU1FJykpKV0pXSksX3ZtLl92KFwiIFwiKSxfYygnZGl2Jyx7c3RhdGljQ2xhc3M6XCJncm91cCBpbnB1dFRleHRcIixhdHRyczp7XCJkYXRhLXR5cGVcIjpcInRleHRcIixcImRhdGEtbW9kZWxcIjpcIm51bWJlclwiLFwiZGF0YS1tYXhsZW5ndGhcIjpcIjEwXCJ9fSxbX2MoJ2lucHV0Jyx7ZGlyZWN0aXZlczpbe25hbWU6XCJtb2RlbFwiLHJhd05hbWU6XCJ2LW1vZGVsXCIsdmFsdWU6KF92bS5jb250YWN0Lm51bWJlciksZXhwcmVzc2lvbjpcImNvbnRhY3QubnVtYmVyXCJ9XSxhdHRyczp7XCJpZFwiOlwiY29udGFjdC1udW1iZXJcIixcInR5cGVcIjpcInRleHRcIixcIm1heGxlbmd0aFwiOlwiMTBcIn0sZG9tUHJvcHM6e1widmFsdWVcIjooX3ZtLmNvbnRhY3QubnVtYmVyKX0sb246e1wiaW5wdXRcIjpmdW5jdGlvbigkZXZlbnQpe2lmKCRldmVudC50YXJnZXQuY29tcG9zaW5nKXsgcmV0dXJuOyB9X3ZtLiRzZXQoX3ZtLmNvbnRhY3QsIFwibnVtYmVyXCIsICRldmVudC50YXJnZXQudmFsdWUpfX19KSxfdm0uX3YoXCIgXCIpLF9jKCdzcGFuJyx7c3RhdGljQ2xhc3M6XCJoaWdobGlnaHRcIn0pLF92bS5fdihcIiBcIiksX2MoJ3NwYW4nLHtzdGF0aWNDbGFzczpcImJhclwifSksX3ZtLl92KFwiIFwiKSxfYygnbGFiZWwnLHthdHRyczp7XCJmb3JcIjpcImNvbnRhY3QtbnVtYmVyXCJ9fSxbX3ZtLl92KF92bS5fcyhfdm0uSW50bFN0cmluZygnQVBQX0NPTlRBQ1RfTEFCRUxfTlVNQkVSJykpKV0pXSksX3ZtLl92KFwiIFwiKSxfYygnZGl2Jyx7c3RhdGljQ2xhc3M6XCJncm91cCBcIixzdGF0aWNTdHlsZTp7XCJtYXJnaW4tdG9wXCI6XCIyM3B4XCIsXCJ3aWR0aFwiOlwiMjYzcHhcIixcIm1hcmdpbi1sZWZ0XCI6XCIyM3B4XCJ9LGF0dHJzOntcImRhdGEtdHlwZVwiOlwiYnV0dG9uXCIsXCJkYXRhLWFjdGlvblwiOlwic2F2ZVwifSxvbjp7XCJjbGlja1wiOmZ1bmN0aW9uKCRldmVudCl7JGV2ZW50LnN0b3BQcm9wYWdhdGlvbigpO3JldHVybiBfdm0uc2F2ZSgkZXZlbnQpfX19LFtfYygnaW5wdXQnLHtzdGF0aWNDbGFzczpcImJ0biBidG4tZ3JlZW5cIixzdGF0aWNTdHlsZTp7XCJmb250LXdlaWdodFwiOlwiMTAwXCJ9LGF0dHJzOntcInR5cGVcIjpcImJ1dHRvblwiLFwidmFsdWVcIjpfdm0uSW50bFN0cmluZygnQVBQX0NPTlRBQ1RfU0FWRScpfSxvbjp7XCJjbGlja1wiOmZ1bmN0aW9uKCRldmVudCl7JGV2ZW50LnN0b3BQcm9wYWdhdGlvbigpO3JldHVybiBfdm0uc2F2ZSgkZXZlbnQpfX19KV0pLF92bS5fdihcIiBcIiksX2MoJ2Rpdicse3N0YXRpY0NsYXNzOlwiZ3JvdXBcIixzdGF0aWNTdHlsZTp7XCJtYXJnaW4tdG9wXCI6XCIyM3B4XCIsXCJ3aWR0aFwiOlwiMjYzcHhcIixcIm1hcmdpbi1sZWZ0XCI6XCIyM3B4XCJ9LGF0dHJzOntcImRhdGEtdHlwZVwiOlwiYnV0dG9uXCIsXCJkYXRhLWFjdGlvblwiOlwiY2FuY2VsXCJ9LG9uOntcImNsaWNrXCI6ZnVuY3Rpb24oJGV2ZW50KXskZXZlbnQuc3RvcFByb3BhZ2F0aW9uKCk7cmV0dXJuIF92bS5mb3JjZUNhbmNlbCgkZXZlbnQpfX19LFtfYygnaW5wdXQnLHtzdGF0aWNDbGFzczpcImJ0biBidG4tb3JhbmdlXCIsc3RhdGljU3R5bGU6e1wiZm9udC13ZWlnaHRcIjpcIjEwMFwifSxhdHRyczp7XCJ0eXBlXCI6XCJidXR0b25cIixcInZhbHVlXCI6X3ZtLkludGxTdHJpbmcoJ0FQUF9DT05UQUNUX0NBTkNFTCcpfSxvbjp7XCJjbGlja1wiOmZ1bmN0aW9uKCRldmVudCl7JGV2ZW50LnN0b3BQcm9wYWdhdGlvbigpO3JldHVybiBfdm0uZm9yY2VDYW5jZWwoJGV2ZW50KX19fSldKSxfdm0uX3YoXCIgXCIpLF9jKCdkaXYnLHtzdGF0aWNDbGFzczpcImdyb3VwXCIsc3RhdGljU3R5bGU6e1wibWFyZ2luLXRvcFwiOlwiMjNweFwiLFwid2lkdGhcIjpcIjI2M3B4XCIsXCJtYXJnaW4tbGVmdFwiOlwiMjNweFwifSxhdHRyczp7XCJkYXRhLXR5cGVcIjpcImJ1dHRvblwiLFwiZGF0YS1hY3Rpb25cIjpcImRlbGV0ZUNcIn0sb246e1wiY2xpY2tcIjpmdW5jdGlvbigkZXZlbnQpeyRldmVudC5zdG9wUHJvcGFnYXRpb24oKTtyZXR1cm4gX3ZtLmRlbGV0ZUMoJGV2ZW50KX19fSxbX2MoJ2lucHV0Jyx7c3RhdGljQ2xhc3M6XCJidG4gYnRuLXJlZFwiLHN0YXRpY1N0eWxlOntcImZvbnQtd2VpZ2h0XCI6XCIxMDBcIn0sYXR0cnM6e1widHlwZVwiOlwiYnV0dG9uXCIsXCJ2YWx1ZVwiOl92bS5JbnRsU3RyaW5nKCdBUFBfQ09OVEFDVF9ERUxFVEUnKX0sb246e1wiY2xpY2tcIjpmdW5jdGlvbigkZXZlbnQpeyRldmVudC5zdG9wUHJvcGFnYXRpb24oKTtyZXR1cm4gX3ZtLmRlbGV0ZUMoJGV2ZW50KX19fSldKV0pXSwxKX1cbnZhciBzdGF0aWNSZW5kZXJGbnMgPSBbXVxuXG5leHBvcnQgeyByZW5kZXIsIHN0YXRpY1JlbmRlckZucyB9IiwiPHRlbXBsYXRlPlxuICA8ZGl2XG4gICAgc3R5bGU9XCJ3aWR0aDogMzI2cHg7IGhlaWdodDogNzQzcHg7XCJcbiAgICBjbGFzcz1cInBob25lX2FwcFwiXG4gID5cbiAgICA8UGhvbmVUaXRsZVxuICAgICAgOnRpdGxlPVwiSW50bFN0cmluZygnQVBQX0NPTlRBQ1RfTkVXJylcIlxuICAgICAgQGJhY2s9XCJmb3JjZUNhbmNlbFwiXG4gICAgLz5cbiAgICA8ZGl2IGNsYXNzPVwiY29udGVudCBpbnB1dFRleHRcIj5cbiAgICAgIDxkaXZcbiAgICAgICAgY2xhc3M9XCJncm91cCBzZWxlY3RcIlxuICAgICAgICBkYXRhLXR5cGU9XCJ0ZXh0XCJcbiAgICAgICAgZGF0YS1tb2RlbD1cImRpc3BsYXlcIlxuICAgICAgICBkYXRhLW1heGxlbmd0aD1cIjY0XCJcbiAgICAgID5cbiAgICAgICAgPGlucHV0XG4gICAgICAgICAgaWQ9XCJjb250YWN0LWRpc3BsYXlcIlxuICAgICAgICAgIHYtbW9kZWw9XCJjb250YWN0LmRpc3BsYXlcIlxuICAgICAgICAgIHYtYXV0b2ZvY3VzXG4gICAgICAgICAgdHlwZT1cInRleHRcIlxuICAgICAgICAgIG1heGxlbmd0aD1cIjY0XCJcbiAgICAgICAgPlxuICAgICAgICA8c3BhbiBjbGFzcz1cImhpZ2hsaWdodFwiIC8+XG4gICAgICAgIDxzcGFuIGNsYXNzPVwiYmFyXCIgLz5cbiAgICAgICAgPGxhYmVsIGZvcj1cImNvbnRhY3QtZGlzcGxheVwiPnt7IEludGxTdHJpbmcoJ0FQUF9DT05UQUNUX0xBQkVMX05BTUUnKSB9fTwvbGFiZWw+XG4gICAgICA8L2Rpdj5cblxuICAgICAgPGRpdlxuICAgICAgICBjbGFzcz1cImdyb3VwIGlucHV0VGV4dFwiXG4gICAgICAgIGRhdGEtdHlwZT1cInRleHRcIlxuICAgICAgICBkYXRhLW1vZGVsPVwibnVtYmVyXCJcbiAgICAgICAgZGF0YS1tYXhsZW5ndGg9XCIxMFwiXG4gICAgICA+XG4gICAgICAgIDxpbnB1dFxuICAgICAgICAgIGlkPVwiY29udGFjdC1udW1iZXJcIlxuICAgICAgICAgIHYtbW9kZWw9XCJjb250YWN0Lm51bWJlclwiXG4gICAgICAgICAgdHlwZT1cInRleHRcIlxuICAgICAgICAgIG1heGxlbmd0aD1cIjEwXCJcbiAgICAgICAgPlxuICAgICAgICA8c3BhbiBjbGFzcz1cImhpZ2hsaWdodFwiIC8+XG4gICAgICAgIDxzcGFuIGNsYXNzPVwiYmFyXCIgLz5cbiAgICAgICAgPGxhYmVsIGZvcj1cImNvbnRhY3QtbnVtYmVyXCI+e3sgSW50bFN0cmluZygnQVBQX0NPTlRBQ1RfTEFCRUxfTlVNQkVSJykgfX08L2xhYmVsPlxuICAgICAgPC9kaXY+XG4gICAgICA8ZGl2XG4gICAgICAgIHN0eWxlPVwibWFyZ2luLXRvcDogMjNweDsgd2lkdGg6IDI2M3B4OyBtYXJnaW4tbGVmdDogMjNweDsgXCJcbiAgICAgICAgY2xhc3M9XCJncm91cCBcIlxuICAgICAgICBkYXRhLXR5cGU9XCJidXR0b25cIlxuICAgICAgICBkYXRhLWFjdGlvbj1cInNhdmVcIlxuICAgICAgICBAY2xpY2suc3RvcD1cInNhdmVcIlxuICAgICAgPlxuICAgICAgICA8aW5wdXRcbiAgICAgICAgICBzdHlsZT1cImZvbnQtd2VpZ2h0OiAxMDA7XCJcbiAgICAgICAgICB0eXBlPVwiYnV0dG9uXCJcbiAgICAgICAgICBjbGFzcz1cImJ0biBidG4tZ3JlZW5cIlxuICAgICAgICAgIDp2YWx1ZT1cIkludGxTdHJpbmcoJ0FQUF9DT05UQUNUX1NBVkUnKVwiXG4gICAgICAgICAgQGNsaWNrLnN0b3A9XCJzYXZlXCJcbiAgICAgICAgPlxuICAgICAgPC9kaXY+XG4gICAgICA8ZGl2XG4gICAgICAgIHN0eWxlPVwibWFyZ2luLXRvcDogMjNweDsgd2lkdGg6IDI2M3B4OyBtYXJnaW4tbGVmdDogMjNweDtcIlxuICAgICAgICBjbGFzcz1cImdyb3VwXCJcbiAgICAgICAgZGF0YS10eXBlPVwiYnV0dG9uXCJcbiAgICAgICAgZGF0YS1hY3Rpb249XCJjYW5jZWxcIlxuICAgICAgICBAY2xpY2suc3RvcD1cImZvcmNlQ2FuY2VsXCJcbiAgICAgID5cbiAgICAgICAgPGlucHV0XG4gICAgICAgICAgc3R5bGU9XCJmb250LXdlaWdodDogMTAwO1wiXG4gICAgICAgICAgdHlwZT1cImJ1dHRvblwiXG4gICAgICAgICAgY2xhc3M9XCJidG4gYnRuLW9yYW5nZVwiXG4gICAgICAgICAgOnZhbHVlPVwiSW50bFN0cmluZygnQVBQX0NPTlRBQ1RfQ0FOQ0VMJylcIlxuICAgICAgICAgIEBjbGljay5zdG9wPVwiZm9yY2VDYW5jZWxcIlxuICAgICAgICA+XG4gICAgICA8L2Rpdj5cbiAgICAgIDxkaXZcbiAgICAgICAgc3R5bGU9XCJtYXJnaW4tdG9wOiAyM3B4OyB3aWR0aDogMjYzcHg7IG1hcmdpbi1sZWZ0OiAyM3B4O1wiXG4gICAgICAgIGNsYXNzPVwiZ3JvdXBcIlxuICAgICAgICBkYXRhLXR5cGU9XCJidXR0b25cIlxuICAgICAgICBkYXRhLWFjdGlvbj1cImRlbGV0ZUNcIlxuICAgICAgICBAY2xpY2suc3RvcD1cImRlbGV0ZUNcIlxuICAgICAgPlxuICAgICAgICA8aW5wdXRcbiAgICAgICAgICBzdHlsZT1cImZvbnQtd2VpZ2h0OiAxMDA7XCJcbiAgICAgICAgICB0eXBlPVwiYnV0dG9uXCJcbiAgICAgICAgICBjbGFzcz1cImJ0biBidG4tcmVkXCJcbiAgICAgICAgICA6dmFsdWU9XCJJbnRsU3RyaW5nKCdBUFBfQ09OVEFDVF9ERUxFVEUnKVwiXG4gICAgICAgICAgQGNsaWNrLnN0b3A9XCJkZWxldGVDXCJcbiAgICAgICAgPlxuICAgICAgPC9kaXY+XG4gICAgPC9kaXY+XG4gIDwvZGl2PlxuPC90ZW1wbGF0ZT5cblxuPHNjcmlwdD5cbmltcG9ydCB7IG1hcEdldHRlcnMsIG1hcEFjdGlvbnMgfSBmcm9tICd2dWV4J1xuaW1wb3J0IFBob25lVGl0bGUgZnJvbSAnLi8uLi9QaG9uZVRpdGxlJ1xuaW1wb3J0IE1vZGFsIGZyb20gJ0AvY29tcG9uZW50cy9Nb2RhbC9pbmRleC5qcydcblxuZXhwb3J0IGRlZmF1bHQge1xuICBjb21wb25lbnRzOiB7XG4gICAgUGhvbmVUaXRsZVxuICB9LFxuICBkYXRhICgpIHtcbiAgICByZXR1cm4ge1xuICAgICAgaWQ6IC0xLFxuICAgICAgY3VycmVudFNlbGVjdDogMCxcbiAgICAgIGlnbm9yZUNvbnRyb2xzOiBmYWxzZSxcbiAgICAgIGNvbnRhY3Q6IHtcbiAgICAgICAgZGlzcGxheTogJycsXG4gICAgICAgIG51bWJlcjogJycsXG4gICAgICAgIGlkOiAtMVxuICAgICAgfVxuICAgIH1cbiAgfSxcbiAgY29tcHV0ZWQ6IHtcbiAgICAuLi5tYXBHZXR0ZXJzKFsnSW50bFN0cmluZycsICdjb250YWN0cycsICd1c2VNb3VzZSddKVxuICB9LFxuICAgIGNyZWF0ZWQgKCkge1xuICAgIGlmICghdGhpcy51c2VNb3VzZSkge1xuICAgICAgdGhpcy4kYnVzLiRvbigna2V5VXBBcnJvd0Rvd24nLCB0aGlzLm9uRG93bilcbiAgICAgIHRoaXMuJGJ1cy4kb24oJ2tleVVwQXJyb3dVcCcsIHRoaXMub25VcClcbiAgICAgIHRoaXMuJGJ1cy4kb24oJ2tleVVwRW50ZXInLCB0aGlzLm9uRW50ZXIpXG4gICAgfSBlbHNlIHtcbiAgICAgIHRoaXMuY3VycmVudFNlbGVjdCA9IC0xXG4gICAgfVxuICAgIHRoaXMuJGJ1cy4kb24oJ2tleVVwQmFja3NwYWNlJywgdGhpcy5jYW5jZWwpXG4gICAgdGhpcy5pZCA9IHBhcnNlSW50KHRoaXMuJHJvdXRlLnBhcmFtcy5pZClcbiAgICB0aGlzLmNvbnRhY3QubnVtYmVyID0gdGhpcy4kcm91dGUucGFyYW1zLm51bWJlclxuICAgIGlmICh0aGlzLmlkICE9PSAtMSkge1xuICAgICAgY29uc3QgYyA9IHRoaXMuY29udGFjdHMuZmluZChlID0+IGUuaWQgPT09IHRoaXMuaWQpXG4gICAgICBpZiAoYyAhPT0gdW5kZWZpbmVkKSB7XG4gICAgICAgIHRoaXMuY29udGFjdCA9IHtcbiAgICAgICAgICBpZDogYy5pZCxcbiAgICAgICAgICBkaXNwbGF5OiBjLmRpc3BsYXksXG4gICAgICAgICAgbnVtYmVyOiBjLm51bWJlclxuICAgICAgICB9XG4gICAgICB9XG4gICAgfVxuICB9LFxuICBiZWZvcmVEZXN0cm95OiBmdW5jdGlvbiAoKSB7XG4gICAgdGhpcy4kYnVzLiRvZmYoJ2tleVVwQXJyb3dEb3duJywgdGhpcy5vbkRvd24pXG4gICAgdGhpcy4kYnVzLiRvZmYoJ2tleVVwQXJyb3dVcCcsIHRoaXMub25VcClcbiAgICB0aGlzLiRidXMuJG9mZigna2V5VXBFbnRlcicsIHRoaXMub25FbnRlcilcbiAgICB0aGlzLiRidXMuJG9mZigna2V5VXBCYWNrc3BhY2UnLCB0aGlzLmNhbmNlbClcbiAgfSxcbiAgbWV0aG9kczoge1xuICAgIC4uLm1hcEFjdGlvbnMoWyd1cGRhdGVDb250YWN0JywgJ2FkZENvbnRhY3QnXSksXG4gICAgb25VcCAoKSB7XG4gICAgICBpZiAodGhpcy5pZ25vcmVDb250cm9scyA9PT0gdHJ1ZSkgcmV0dXJuXG4gICAgICBsZXQgc2VsZWN0ID0gZG9jdW1lbnQucXVlcnlTZWxlY3RvcignLmdyb3VwLnNlbGVjdCcpXG4gICAgICBpZiAoc2VsZWN0LnByZXZpb3VzRWxlbWVudFNpYmxpbmcgIT09IG51bGwpIHtcbiAgICAgICAgZG9jdW1lbnQucXVlcnlTZWxlY3RvckFsbCgnLmdyb3VwJykuZm9yRWFjaChlbGVtID0+IHtcbiAgICAgICAgICBlbGVtLmNsYXNzTGlzdC5yZW1vdmUoJ3NlbGVjdCcpXG4gICAgICAgIH0pXG4gICAgICAgIHNlbGVjdC5wcmV2aW91c0VsZW1lbnRTaWJsaW5nLmNsYXNzTGlzdC5hZGQoJ3NlbGVjdCcpXG4gICAgICAgIGxldCBpID0gc2VsZWN0LnByZXZpb3VzRWxlbWVudFNpYmxpbmcucXVlcnlTZWxlY3RvcignaW5wdXQnKVxuICAgICAgICBpZiAoaSAhPT0gbnVsbCkge1xuICAgICAgICAgIGkuZm9jdXMoKVxuICAgICAgICB9XG4gICAgICB9XG4gICAgfSxcbiAgICBvbkRvd24gKCkge1xuICAgICAgaWYgKHRoaXMuaWdub3JlQ29udHJvbHMgPT09IHRydWUpIHJldHVyblxuICAgICAgbGV0IHNlbGVjdCA9IGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3IoJy5ncm91cC5zZWxlY3QnKVxuICAgICAgaWYgKHNlbGVjdC5uZXh0RWxlbWVudFNpYmxpbmcgIT09IG51bGwpIHtcbiAgICAgICAgZG9jdW1lbnQucXVlcnlTZWxlY3RvckFsbCgnLmdyb3VwJykuZm9yRWFjaChlbGVtID0+IHtcbiAgICAgICAgICBlbGVtLmNsYXNzTGlzdC5yZW1vdmUoJ3NlbGVjdCcpXG4gICAgICAgIH0pXG4gICAgICAgIHNlbGVjdC5uZXh0RWxlbWVudFNpYmxpbmcuY2xhc3NMaXN0LmFkZCgnc2VsZWN0JylcbiAgICAgICAgbGV0IGkgPSBzZWxlY3QubmV4dEVsZW1lbnRTaWJsaW5nLnF1ZXJ5U2VsZWN0b3IoJ2lucHV0JylcbiAgICAgICAgaWYgKGkgIT09IG51bGwpIHtcbiAgICAgICAgICBpLmZvY3VzKClcbiAgICAgICAgfVxuICAgICAgfVxuICAgIH0sXG4gICAgb25FbnRlciAoKSB7XG4gICAgICBpZiAodGhpcy5pZ25vcmVDb250cm9scyA9PT0gdHJ1ZSkgcmV0dXJuXG4gICAgICBsZXQgc2VsZWN0ID0gZG9jdW1lbnQucXVlcnlTZWxlY3RvcignLmdyb3VwLnNlbGVjdCcpXG4gICAgICBpZiAoc2VsZWN0LmRhdGFzZXQudHlwZSA9PT0gJ3RleHQnKSB7XG4gICAgICAgIGxldCBvcHRpb25zID0ge1xuICAgICAgICAgIGxpbWl0OiBwYXJzZUludChzZWxlY3QuZGF0YXNldC5tYXhsZW5ndGgpIHx8IDY0LFxuICAgICAgICAgIHRleHQ6IHRoaXMuY29udGFjdFtzZWxlY3QuZGF0YXNldC5tb2RlbF0gfHwgJydcbiAgICAgICAgfVxuICAgICAgICB0aGlzLiRwaG9uZUFQSS5nZXRSZXBvbnNlVGV4dChvcHRpb25zKS50aGVuKGRhdGEgPT4ge1xuICAgICAgICAgIHRoaXMuY29udGFjdFtzZWxlY3QuZGF0YXNldC5tb2RlbF0gPSBkYXRhLnRleHRcbiAgICAgICAgfSlcbiAgICAgIH1cbiAgICAgIGlmIChzZWxlY3QuZGF0YXNldC5hY3Rpb24gJiYgdGhpc1tzZWxlY3QuZGF0YXNldC5hY3Rpb25dKSB7XG4gICAgICAgIHRoaXNbc2VsZWN0LmRhdGFzZXQuYWN0aW9uXSgpXG4gICAgICB9XG4gICAgfSxcbiAgICBzYXZlICgpIHtcbiAgICAgIGlmICh0aGlzLmlkID09PSAtMSB8fCB0aGlzLmlkID09PSAwKSB7XG4gICAgICAgIHRoaXMuYWRkQ29udGFjdCh7XG4gICAgICAgICAgZGlzcGxheTogdGhpcy5jb250YWN0LmRpc3BsYXksXG4gICAgICAgICAgbnVtYmVyOiB0aGlzLmNvbnRhY3QubnVtYmVyXG4gICAgICAgIH0pXG4gICAgICB9IGVsc2Uge1xuICAgICAgICB0aGlzLnVwZGF0ZUNvbnRhY3Qoe1xuICAgICAgICAgIGlkOiB0aGlzLmlkLFxuICAgICAgICAgIGRpc3BsYXk6IHRoaXMuY29udGFjdC5kaXNwbGF5LFxuICAgICAgICAgIG51bWJlcjogdGhpcy5jb250YWN0Lm51bWJlclxuICAgICAgICB9KVxuICAgICAgfVxuICAgICAgaGlzdG9yeS5iYWNrKClcbiAgICB9LFxuICAgIGNhbmNlbCAoKSB7XG4gICAgICBpZiAodGhpcy5pZ25vcmVDb250cm9scyA9PT0gdHJ1ZSkgcmV0dXJuXG4gICAgICBpZiAodGhpcy51c2VNb3VzZSA9PT0gdHJ1ZSAmJiBkb2N1bWVudC5hY3RpdmVFbGVtZW50LnRhZ05hbWUgIT09ICdCT0RZJykgcmV0dXJuXG4gICAgICBoaXN0b3J5LmJhY2soKVxuICAgIH0sXG4gICAgZm9yY2VDYW5jZWwgKCkge1xuICAgICAgaGlzdG9yeS5iYWNrKClcbiAgICB9LFxuICAgIGRlbGV0ZUMgKCkge1xuICAgICAgaWYgKHRoaXMuaWQgIT09IC0xKSB7XG4gICAgICAgIHRoaXMuaWdub3JlQ29udHJvbHMgPSB0cnVlXG4gICAgICAgIGxldCBjaG9peCA9IFt7dGl0bGU6ICdBbm51bGVyJ30sIHt0aXRsZTogJ0FubnVsZXInfSwge3RpdGxlOiAnU3VwcHJpbWVyJywgY29sb3I6ICdyZWQnfSwge3RpdGxlOiAnQW5udWxlcid9LCB7dGl0bGU6ICdBbm51bGVyJ31dXG4gICAgICAgIE1vZGFsLkNyZWF0ZU1vZGFsKHtjaG9peH0pLnRoZW4ocmVwb25zZSA9PiB7XG4gICAgICAgICAgdGhpcy5pZ25vcmVDb250cm9scyA9IGZhbHNlXG4gICAgICAgICAgaWYgKHJlcG9uc2UudGl0bGUgPT09ICdTdXBwcmltZXInKSB7XG4gICAgICAgICAgICB0aGlzLiRwaG9uZUFQSS5kZWxldGVDb250YWN0KHRoaXMuaWQpXG4gICAgICAgICAgICBoaXN0b3J5LmJhY2soKVxuICAgICAgICAgIH1cbiAgICAgICAgfSlcbiAgICAgIH0gZWxzZSB7XG4gICAgICAgIGhpc3RvcnkuYmFjaygpXG4gICAgICB9XG4gICAgfVxuICB9XG59XG48L3NjcmlwdD5cblxuPHN0eWxlIHNjb3BlZD5cbi5jb250YWN0e1xuICBwb3NpdGlvbjogcmVsYXRpdmU7XG4gIGxlZnQ6IDA7XG4gIHRvcDogMDtcbiAgd2lkdGg6IDEwMCU7XG4gIGhlaWdodDogMTAwJTtcbn1cbi50aXRsZXtcbiAgICBwYWRkaW5nLWxlZnQ6IDE2cHg7XG4gICAgaGVpZ2h0OiAzNHB4O1xuICAgIGxpbmUtaGVpZ2h0OiAzNHB4O1xuICAgIGZvbnQtd2VpZ2h0OiA3MDA7XG4gICAgYmFja2dyb3VuZC1jb2xvcjogIzUyNjRBRTtcbiAgICBjb2xvcjogd2hpdGU7XG59XG4uY29udGVudHtcbiAgbWFyZ2luOiAyOHB4IDEwcHggNnB4O1xufVxuLmdyb3VwIHtcbiAgcG9zaXRpb246cmVsYXRpdmU7XG4gIG1hcmdpbi10b3A6MjRweDtcbn1cbi5ncm91cC5pbnB1dFRleHQge1xuICBwb3NpdGlvbjpyZWxhdGl2ZTtcbiAgbWFyZ2luLXRvcDo0NXB4O1xufVxuaW5wdXQge1xuICBkaXNwbGF5OmJsb2NrO1xuICB3aWR0aDoxMDAlO1xuICBib3JkZXI6bm9uZTtcbiAgYm9yZGVyLWJvdHRvbToxcHggc29saWQgI2U5ZTllYjtcbiAgZm9udC13ZWlnaHQ6IDEwMDtcbiAgZm9udC1zaXplOiAyMHB4O1xufVxuaW5wdXQ6Zm9jdXMgXHRcdHsgb3V0bGluZTpub25lOyB9XG5cbi8qIExBQkVMID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSAqL1xubGFiZWwgXHRcdFx0XHQge1xuICBjb2xvcjojOTk5O1xuICBmb250LXNpemU6MThweDtcbiAgZm9udC13ZWlnaHQ6bm9ybWFsO1xuICBwb3NpdGlvbjphYnNvbHV0ZTtcbiAgcG9pbnRlci1ldmVudHM6bm9uZTtcbiAgbGVmdDo1cHg7XG4gIHRvcDoxMHB4O1xuICB0cmFuc2l0aW9uOjAuMnMgZWFzZSBhbGw7XG4gIC1tb3otdHJhbnNpdGlvbjowLjJzIGVhc2UgYWxsO1xuICAtd2Via2l0LXRyYW5zaXRpb246MC4ycyBlYXNlIGFsbDtcbn1cblxuLyogYWN0aXZlIHN0YXRlICovXG5pbnB1dDpmb2N1cyB+IGxhYmVsLCBpbnB1dDp2YWxpZCB+IGxhYmVsIFx0XHR7XG4gIHRvcDotMjRweDtcbiAgZm9udC1zaXplOjE4cHg7XG4gIGNvbG9yOmdyYXk7XG59XG5cbi8qIEJPVFRPTSBCQVJTID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSAqL1xuLmJhciBcdHsgcG9zaXRpb246cmVsYXRpdmU7IGRpc3BsYXk6YmxvY2s7IHdpZHRoOjEwMCU7IH1cbi5iYXI6YmVmb3JlLCAuYmFyOmFmdGVyIFx0e1xuICBjb250ZW50OicnO1xuICBoZWlnaHQ6M3B4O1xuICB3aWR0aDowO1xuICBib3R0b206MXB4O1xuICBwb3NpdGlvbjphYnNvbHV0ZTtcbiAgdHJhbnNpdGlvbjowLjJzIGVhc2UgYWxsO1xuICAtbW96LXRyYW5zaXRpb246MC4ycyBlYXNlIGFsbDtcbiAgLXdlYmtpdC10cmFuc2l0aW9uOjAuMnMgZWFzZSBhbGw7XG59XG4uYmFyOmJlZm9yZSB7XG4gIGxlZnQ6NTAlO1xufVxuLmJhcjphZnRlciB7XG4gIHJpZ2h0OjUwJTtcbn1cblxuLyogYWN0aXZlIHN0YXRlICovXG5pbnB1dDpmb2N1cyB+IC5iYXI6YmVmb3JlLCBpbnB1dDpmb2N1cyB+IC5iYXI6YWZ0ZXIsXG4uZ3JvdXAuc2VsZWN0IGlucHV0IH4gLmJhcjpiZWZvcmUsIC5ncm91cC5zZWxlY3QgaW5wdXQgfiAuYmFyOmFmdGVye1xuICB3aWR0aDo1MCU7XG59XG5cbi8qIEhJR0hMSUdIVEVSID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0gKi9cbi5oaWdobGlnaHQge1xuICBwb3NpdGlvbjphYnNvbHV0ZTtcbiAgaGVpZ2h0OjYwJTtcbiAgd2lkdGg6MTAwcHg7XG4gIHRvcDoyNSU7XG4gIGxlZnQ6MDtcbiAgcG9pbnRlci1ldmVudHM6bm9uZTtcbiAgb3BhY2l0eTowLjU7XG59XG5cbi8qIGFjdGl2ZSBzdGF0ZSAqL1xuaW5wdXQ6Zm9jdXMgfiAuaGlnaGxpZ2h0IHtcbiAgLXdlYmtpdC1hbmltYXRpb246aW5wdXRIaWdobGlnaHRlciAwLjNzIGVhc2U7XG4gIC1tb3otYW5pbWF0aW9uOmlucHV0SGlnaGxpZ2h0ZXIgMC4zcyBlYXNlO1xuICBhbmltYXRpb246aW5wdXRIaWdobGlnaHRlciAwLjNzIGVhc2U7XG59XG5cbi5ncm91cCAuYnRue1xuICAgIHdpZHRoOiAxMDAlO1xuICAgIHBhZGRpbmc6IDBweCAwcHg7XG4gICAgaGVpZ2h0OiA0OHB4O1xuICAgIGJvcmRlcjogMCBub25lO1xuICAgIGZvbnQtc2l6ZTogMjJweDtcbiAgICBmb250LXdlaWdodDogNTAwO1xuICAgIGxpbmUtaGVpZ2h0OiAzNHB4O1xuICAgIGNvbG9yOiAjMjAyMTI5O1xuICAgIGJhY2tncm91bmQtY29sb3I6ICNlZGVlZWU7XG59XG4uZ3JvdXAuc2VsZWN0IC5idG57XG4gICAgLyogYm9yZGVyOiA2cHggc29saWQgI0MwQzBDMDsgKi9cbiAgICBsaW5lLWhlaWdodDogMThweDtcbn1cblxuLmdyb3VwIC5idG4uYnRuLWdyZWVue1xuICBib3JkZXI6IDFweCBzb2xpZCAjMGI4MWZmO1xuICBjb2xvcjogIzBiODFmZjtcbiAgYmFja2dyb3VuZC1jb2xvcjogd2hpdGU7XG4gIGZvbnQtd2VpZ2h0OiA1MDA7XG4gIGJvcmRlci1yYWRpdXM6IDI4cHg7XG59XG4uZ3JvdXAuc2VsZWN0IC5idG4uYnRuLWdyZWVuLCAuZ3JvdXA6aG92ZXIgLmJ0bi5idG4tZ3JlZW57XG4gIGJhY2tncm91bmQtaW1hZ2U6IGxpbmVhci1ncmFkaWVudCh0byByaWdodCwgIzYyQTNGRiwgIzQ5OTRGRiAsICMwYjgxZmYpO1xuICBjb2xvcjogd2hpdGU7XG4gIGJvcmRlcjogbm9uZTtcbn1cbi5ncm91cCAuYnRuLmJ0bi1vcmFuZ2V7XG4gIGJvcmRlcjogMXB4IHNvbGlkICNCNkI2QjY7XG4gIGNvbG9yOiAjQjZCNkI2O1xuICBiYWNrZ3JvdW5kLWNvbG9yOiB3aGl0ZTtcbiAgZm9udC13ZWlnaHQ6IDUwMDtcbiAgYm9yZGVyLXJhZGl1czogMjhweDtcbn1cbi5ncm91cC5zZWxlY3QgLmJ0bi5idG4tb3JhbmdlLCAuZ3JvdXA6aG92ZXIgLmJ0bi5idG4tb3Jhbmdle1xuXG4gIGJhY2tncm91bmQtaW1hZ2U6IGxpbmVhci1ncmFkaWVudCh0byByaWdodCwgI0QzRDNEMywgI0M1QzVDNSAsICNCNkI2QjYpO1xuICBjb2xvcjogd2hpdGU7XG4gIGJvcmRlcjogI0I2QjZCNjtcbn1cblxuLmdyb3VwIC5idG4uYnRuLXJlZHtcbiAgYm9yZGVyOiAxcHggc29saWQgI2U3NGMzYzgwO1xuICBjb2xvcjogI2U3NGMzYztcbiAgYmFja2dyb3VuZC1jb2xvcjogd2hpdGU7XG4gIGZvbnQtd2VpZ2h0OiA1MDA7XG4gIGJvcmRlci1yYWRpdXM6IDI4cHg7XG59XG4uZ3JvdXAuc2VsZWN0IC5idG4uYnRuLXJlZCwgLmdyb3VwOmhvdmVyIC5idG4uYnRuLXJlZHtcbiAgYmFja2dyb3VuZC1pbWFnZTogbGluZWFyLWdyYWRpZW50KHRvIHJpZ2h0LCAjRkY1QjVCLCAjRkY0QjRCICwgI0ZFM0MzQyk7XG4gIGNvbG9yOiB3aGl0ZTtcbiAgYm9yZGVyOiBub25lO1xufVxuXG4vKiBBTklNQVRJT05TID09PT09PT09PT09PT09PT0gKi9cbkAtd2Via2l0LWtleWZyYW1lcyBpbnB1dEhpZ2hsaWdodGVyIHtcblx0ZnJvbSB7IGJhY2tncm91bmQ6IzUyNjRBRTsgfVxuICB0byBcdHsgd2lkdGg6MDsgYmFja2dyb3VuZDp0cmFuc3BhcmVudDsgfVxufVxuQC1tb3ota2V5ZnJhbWVzIGlucHV0SGlnaGxpZ2h0ZXIge1xuXHRmcm9tIHsgYmFja2dyb3VuZDojNTI2NEFFOyB9XG4gIHRvIFx0eyB3aWR0aDowOyBiYWNrZ3JvdW5kOnRyYW5zcGFyZW50OyB9XG59XG5Aa2V5ZnJhbWVzIGlucHV0SGlnaGxpZ2h0ZXIge1xuXHRmcm9tIHsgYmFja2dyb3VuZDojNTI2NEFFOyB9XG4gIHRvIFx0eyB3aWR0aDowOyBiYWNrZ3JvdW5kOnRyYW5zcGFyZW50OyB9XG59XG48L3N0eWxlPlxuXG4iLCJpbXBvcnQgbW9kIGZyb20gXCItIS4uLy4uLy4uL25vZGVfbW9kdWxlcy9iYWJlbC1sb2FkZXIvbGliL2luZGV4LmpzIS4uLy4uLy4uL25vZGVfbW9kdWxlcy92dWUtbG9hZGVyL2xpYi9pbmRleC5qcz8/dnVlLWxvYWRlci1vcHRpb25zIS4vQ29udGFjdC52dWU/dnVlJnR5cGU9c2NyaXB0Jmxhbmc9anMmXCI7IGV4cG9ydCBkZWZhdWx0IG1vZDsgZXhwb3J0ICogZnJvbSBcIi0hLi4vLi4vLi4vbm9kZV9tb2R1bGVzL2JhYmVsLWxvYWRlci9saWIvaW5kZXguanMhLi4vLi4vLi4vbm9kZV9tb2R1bGVzL3Z1ZS1sb2FkZXIvbGliL2luZGV4LmpzPz92dWUtbG9hZGVyLW9wdGlvbnMhLi9Db250YWN0LnZ1ZT92dWUmdHlwZT1zY3JpcHQmbGFuZz1qcyZcIiIsImltcG9ydCB7IHJlbmRlciwgc3RhdGljUmVuZGVyRm5zIH0gZnJvbSBcIi4vQ29udGFjdC52dWU/dnVlJnR5cGU9dGVtcGxhdGUmaWQ9MjdhYjU5Njgmc2NvcGVkPXRydWUmXCJcbmltcG9ydCBzY3JpcHQgZnJvbSBcIi4vQ29udGFjdC52dWU/dnVlJnR5cGU9c2NyaXB0Jmxhbmc9anMmXCJcbmV4cG9ydCAqIGZyb20gXCIuL0NvbnRhY3QudnVlP3Z1ZSZ0eXBlPXNjcmlwdCZsYW5nPWpzJlwiXG5pbXBvcnQgc3R5bGUwIGZyb20gXCIuL0NvbnRhY3QudnVlP3Z1ZSZ0eXBlPXN0eWxlJmluZGV4PTAmaWQ9MjdhYjU5Njgmc2NvcGVkPXRydWUmbGFuZz1jc3MmXCJcblxuXG4vKiBub3JtYWxpemUgY29tcG9uZW50ICovXG5pbXBvcnQgbm9ybWFsaXplciBmcm9tIFwiIS4uLy4uLy4uL25vZGVfbW9kdWxlcy92dWUtbG9hZGVyL2xpYi9ydW50aW1lL2NvbXBvbmVudE5vcm1hbGl6ZXIuanNcIlxudmFyIGNvbXBvbmVudCA9IG5vcm1hbGl6ZXIoXG4gIHNjcmlwdCxcbiAgcmVuZGVyLFxuICBzdGF0aWNSZW5kZXJGbnMsXG4gIGZhbHNlLFxuICBudWxsLFxuICBcIjI3YWI1OTY4XCIsXG4gIG51bGxcbiAgXG4pXG5cbmV4cG9ydCBkZWZhdWx0IGNvbXBvbmVudC5leHBvcnRzIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///4304\n')}}]);