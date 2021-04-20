(self.webpackChunksrc_htmlphone = self.webpackChunksrc_htmlphone || []).push([
    [4139], {
        4139: function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval("// ESM COMPAT FLAG\n__webpack_require__.r(__webpack_exports__);\n\n// EXPORTS\n__webpack_require__.d(__webpack_exports__, {\n  \"default\": function() { return /* binding */ Parametre; }\n});\n\n;// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/parametre/Parametre.vue?vue&type=template&id=5e72fac8&scoped=true&\nvar render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c('div',{staticClass:\"phone_app\"},[_c('PhoneTitle',{attrs:{\"title\":_vm.IntlString('APP_CONFIG_TITLE')},on:{\"back\":_vm.onBackspace}}),_vm._v(\" \"),_c('div',{staticClass:\"phone_content elements\"},[_vm._l((_vm.paramList),function(elem,key){return _c('div',{key:key,staticClass:\"element\",class:{ select: key === _vm.currentSelect},on:{\"click\":function($event){$event.stopPropagation();return _vm.onPressItem(key)}}},[_c('div',{staticClass:\"fa\"},[_c('FontAwesomeIcon',{attrs:{\"icon\":['fas', elem.icons]},on:{\"click\":function($event){$event.stopPropagation();return _vm.onPressItem(key)}}})],1),_vm._v(\" \"),_c('div',{staticClass:\"element-content\",on:{\"click\":function($event){$event.stopPropagation();return _vm.onPressItem(key)}}},[_c('span',{staticClass:\"element-title\",on:{\"click\":function($event){$event.stopPropagation();return _vm.onPressItem(key)}}},[_vm._v(_vm._s(elem.title))]),_vm._v(\" \"),(elem.value)?_c('span',{staticClass:\"element-value\",on:{\"click\":function($event){$event.stopPropagation();return _vm.onPressItem(key)}}},[_vm._v(_vm._s(elem.value))]):_vm._e()])])}),_vm._v(\" \"),_c('div',{staticClass:\"element\"},[_c('div',{staticClass:\"fa\"},[_c('FontAwesomeIcon',{attrs:{\"icon\":['fas', 'undo']}})],1),_vm._v(\" \"),_c('div',{staticClass:\"element-content\"},[_c('span',{staticClass:\"element-title\"},[_vm._v(\"\\n          Phone Version\\n        \")]),_vm._v(\" \"),_c('span',{staticClass:\"element-value\"},[_vm._v(_vm._s(_vm.currentVersion))])])])],2)],1)}\nvar staticRenderFns = []\n\n\n// EXTERNAL MODULE: ./node_modules/@babel/runtime/helpers/esm/asyncToGenerator.js\nvar asyncToGenerator = __webpack_require__(2137);\n// EXTERNAL MODULE: ./node_modules/@babel/runtime/helpers/esm/defineProperty.js\nvar defineProperty = __webpack_require__(6156);\n// EXTERNAL MODULE: ./node_modules/@babel/runtime/regenerator/index.js\nvar regenerator = __webpack_require__(7757);\nvar regenerator_default = /*#__PURE__*/__webpack_require__.n(regenerator);\n// EXTERNAL MODULE: ./node_modules/vuex/dist/vuex.esm.js\nvar vuex_esm = __webpack_require__(629);\n// EXTERNAL MODULE: ./src/components/PhoneTitle.vue + 3 modules\nvar PhoneTitle = __webpack_require__(5317);\n// EXTERNAL MODULE: ./src/components/Modal/index.js + 8 modules\nvar Modal = __webpack_require__(4410);\n;// CONCATENATED MODULE: ./node_modules/babel-loader/lib/index.js!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/parametre/Parametre.vue?vue&type=script&lang=js&\n\n\n\n\nfunction ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }\n\nfunction _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { (0,defineProperty/* default */.Z)(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }\n\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n\n\n\n/* harmony default export */ var Parametrevue_type_script_lang_js_ = ({\n  components: {\n    PhoneTitle: PhoneTitle/* default */.Z\n  },\n  data: function data() {\n    return {\n      currentVersion: \"1.0\",\n      ignoreControls: false,\n      currentSelect: 0\n    };\n  },\n  computed: _objectSpread(_objectSpread({}, (0,vuex_esm/* mapGetters */.Se)(['IntlString', 'useMouse', 'myPhoneNumber', 'backgroundLabel', 'coqueLabel', 'sonidoLabel', 'zoom', 'config', 'volume', 'availableLanguages'])), {}, {\n    paramList: function paramList() {\n      var cancelStr = this.IntlString('CANCEL');\n      var confirmResetStr = this.IntlString('APP_CONFIG_RESET_CONFIRM');\n      var cancelOption = {};\n      var confirmReset = {};\n      cancelOption[cancelStr] = 'cancel';\n      confirmReset[confirmResetStr] = 'accept';\n      return [{\n        icons: 'phone',\n        title: this.IntlString('APP_CONFIG_MY_MUNBER'),\n        value: this.myPhoneNumber\n      }, {\n        icons: 'image',\n        title: this.IntlString('APP_CONFIG_WALLPAPER'),\n        value: this.backgroundLabel,\n        onValid: 'onChangeBackground',\n        values: this.config.background\n      }, {\n        icons: 'mobile',\n        title: this.IntlString('APP_CONFIG_CASE'),\n        value: this.coqueLabel,\n        onValid: 'onChangeCoque',\n        values: this.config.coque\n      }, {\n        icons: 'bell',\n        title: this.IntlString('APP_CONFIG_SOUND'),\n        value: this.sonidoLabel,\n        onValid: 'onChangeSonido',\n        values: this.config.sonido\n      }, {\n        icons: 'search',\n        title: this.IntlString('APP_CONFIG_ZOOM'),\n        value: this.zoom,\n        onValid: 'setZoom',\n        onLeft: this.ajustZoom(-1),\n        onRight: this.ajustZoom(1),\n        values: {\n          '125 %': '125%',\n          '100 %': '100%',\n          '80 %': '80%',\n          '60 %': '60%',\n          '40 %': '40%',\n          '20 %': '20%'\n        }\n      }, {\n        icons: 'volume-down',\n        title: this.IntlString('APP_CONFIG_VOLUME'),\n        value: this.valumeDisplay,\n        onValid: 'setPhoneVolume',\n        onLeft: this.ajustVolume(-0.01),\n        onRight: this.ajustVolume(0.01),\n        values: {\n          '100 %': 1,\n          '80 %': 0.8,\n          '60 %': 0.6,\n          '40 %': 0.4,\n          '20 %': 0.05,\n          '0 %': 0\n        }\n      }, {\n        icons: 'globe-americas',\n        title: this.IntlString('APP_CONFIG_LANGUAGE'),\n        onValid: 'onChangeLanguages',\n        values: _objectSpread(_objectSpread({}, this.availableLanguages), cancelOption)\n      }, {\n        icons: 'mouse-pointer',\n        title: this.IntlString('APP_CONFIG_MOUSE_SUPPORT'),\n        onValid: 'onChangeMouseSupport',\n        values: _objectSpread({\n          'Yes': true,\n          'No': false\n        }, cancelOption)\n      }, {\n        icons: 'exclamation-triangle',\n        color: '#ee3838',\n        title: this.IntlString('APP_CONFIG_RESET'),\n        onValid: 'resetPhone',\n        values: _objectSpread(_objectSpread({}, confirmReset), cancelOption)\n      }];\n    },\n    valumeDisplay: function valumeDisplay() {\n      return \"\".concat(Math.floor(this.volume * 20), \" %\");\n    }\n  }),\n  created: function created() {\n    if (!this.useMouse) {\n      this.$bus.$on('keyUpArrowRight', this.onRight);\n      this.$bus.$on('keyUpArrowLeft', this.onLeft);\n      this.$bus.$on('keyUpArrowDown', this.onDown);\n      this.$bus.$on('keyUpArrowUp', this.onUp);\n      this.$bus.$on('keyUpEnter', this.onEnter);\n    } else {\n      this.currentSelect = -1;\n    }\n\n    this.$bus.$on('keyUpBackspace', this.onBackspace);\n  },\n  beforeDestroy: function beforeDestroy() {\n    this.$bus.$off('keyUpArrowRight', this.onRight);\n    this.$bus.$off('keyUpArrowLeft', this.onLeft);\n    this.$bus.$off('keyUpArrowDown', this.onDown);\n    this.$bus.$off('keyUpArrowUp', this.onUp);\n    this.$bus.$off('keyUpEnter', this.onEnter);\n    this.$bus.$off('keyUpBackspace', this.onBackspace);\n  },\n  methods: _objectSpread(_objectSpread({}, (0,vuex_esm/* mapActions */.nv)(['getIntlString', 'setZoon', 'setBackground', 'setCoque', 'setSonido', 'setVolume', 'setLanguage', 'setMouseSupport'])), {}, {\n    scrollIntoViewIfNeeded: function scrollIntoViewIfNeeded() {\n      this.$nextTick(function () {\n        document.querySelector('.select').scrollIntoViewIfNeeded();\n      });\n    },\n    onBackspace: function onBackspace() {\n      if (this.ignoreControls === true) return;\n      this.$router.push({\n        name: 'home'\n      });\n    },\n    onUp: function onUp() {\n      if (this.ignoreControls === true) return;\n      this.currentSelect = this.currentSelect === 0 ? 0 : this.currentSelect - 1;\n      this.scrollIntoViewIfNeeded();\n    },\n    onDown: function onDown() {\n      if (this.ignoreControls === true) return;\n      this.currentSelect = this.currentSelect === this.paramList.length - 1 ? this.currentSelect : this.currentSelect + 1;\n      this.scrollIntoViewIfNeeded();\n    },\n    onRight: function onRight() {\n      if (this.ignoreControls === true) return;\n      var param = this.paramList[this.currentSelect];\n\n      if (param.onRight !== undefined) {\n        param.onRight(param);\n      }\n    },\n    onLeft: function onLeft() {\n      if (this.ignoreControls === true) return;\n      var param = this.paramList[this.currentSelect];\n\n      if (param.onLeft !== undefined) {\n        param.onLeft(param);\n      }\n    },\n    actionItem: function actionItem(param) {\n      var _this = this;\n\n      if (param.values !== undefined) {\n        this.ignoreControls = true;\n        var choix = Object.keys(param.values).map(function (key) {\n          return {\n            title: key,\n            value: param.values[key],\n            picto: param.values[key]\n          };\n        });\n        Modal/* default.CreateModal */.Z.CreateModal({\n          choix: choix\n        }).then(function (reponse) {\n          _this.ignoreControls = false;\n          if (reponse.title === 'cancel') return;\n\n          _this[param.onValid](param, reponse);\n        });\n      }\n    },\n    onPressItem: function onPressItem(index) {\n      this.actionItem(this.paramList[index]);\n    },\n    onEnter: function onEnter() {\n      if (this.ignoreControls === true) return;\n      this.actionItem(this.paramList[this.currentSelect]);\n    },\n    onChangeBackground: function onChangeBackground(param, data) {\n      var _this2 = this;\n\n      return (0,asyncToGenerator/* default */.Z)( /*#__PURE__*/regenerator_default().mark(function _callee() {\n        var val;\n        return regenerator_default().wrap(function _callee$(_context) {\n          while (1) {\n            switch (_context.prev = _context.next) {\n              case 0:\n                val = data.value;\n\n                if (val === 'URL') {\n                  _this2.ignoreControls = true;\n                  Modal/* default.CreateTextModal */.Z.CreateTextModal({\n                    text: 'https://i.imgur.com/'\n                  }).then(function (valueText) {\n                    if (valueText.text !== '' && valueText.text !== undefined && valueText.text !== null && valueText.text !== 'https://i.imgur.com/') {\n                      _this2.setBackground({\n                        label: 'Custom',\n                        value: valueText.text\n                      });\n                    }\n                  }).finally(function () {\n                    _this2.ignoreControls = false;\n                  });\n                } else {\n                  _this2.setBackground({\n                    label: data.title,\n                    value: data.value\n                  });\n                }\n\n              case 2:\n              case \"end\":\n                return _context.stop();\n            }\n          }\n        }, _callee);\n      }))();\n    },\n    onChangeCoque: function onChangeCoque(param, data) {\n      this.setCoque({\n        label: data.title,\n        value: data.value\n      });\n    },\n    onChangeSonido: function onChangeSonido(param, data) {\n      this.setSonido({\n        label: data.title,\n        value: data.value\n      });\n    },\n    setZoom: function setZoom(param, data) {\n      this.setZoon(data.value);\n    },\n    ajustZoom: function ajustZoom(inc) {\n      var _this3 = this;\n\n      return function () {\n        var percent = Math.max(10, (parseInt(_this3.zoom) || 100) + inc);\n\n        _this3.setZoon(\"\".concat(percent, \"%\"));\n      };\n    },\n    setPhoneVolume: function setPhoneVolume(param, data) {\n      this.setVolume(data.value);\n    },\n    ajustVolume: function ajustVolume(inc) {\n      var _this4 = this;\n\n      return function () {\n        var newVolume = Math.max(0, Math.min(1, parseFloat(_this4.volume) + inc));\n\n        _this4.setVolume(newVolume);\n      };\n    },\n    onChangeLanguages: function onChangeLanguages(param, data) {\n      if (data.value !== 'cancel') {\n        this.setLanguage(data.value);\n      }\n    },\n    onChangeMouseSupport: function onChangeMouseSupport(param, data) {\n      if (data.value !== 'cancel') {\n        this.setMouseSupport(data.value);\n        this.onBackspace();\n      }\n    },\n    resetPhone: function resetPhone(param, data) {\n      var _this5 = this;\n\n      if (data.value !== 'cancel') {\n        this.ignoreControls = true;\n        var cancelStr = this.IntlString('CANCEL');\n        var confirmResetStr = this.IntlString('APP_CONFIG_RESET_CONFIRM');\n        var choix = [{\n          title: cancelStr\n        }, {\n          title: cancelStr\n        }, {\n          title: confirmResetStr,\n          color: 'red',\n          reset: true\n        }, {\n          title: cancelStr\n        }, {\n          title: cancelStr\n        }];\n        Modal/* default.CreateModal */.Z.CreateModal({\n          choix: choix\n        }).then(function (reponse) {\n          _this5.ignoreControls = false;\n\n          if (reponse.reset === true) {\n            _this5.$phoneAPI.deleteALL();\n          }\n        });\n      }\n    }\n  })\n});\n;// CONCATENATED MODULE: ./src/components/parametre/Parametre.vue?vue&type=script&lang=js&\n /* harmony default export */ var parametre_Parametrevue_type_script_lang_js_ = (Parametrevue_type_script_lang_js_); \n// EXTERNAL MODULE: ./node_modules/vue-loader/lib/runtime/componentNormalizer.js\nvar componentNormalizer = __webpack_require__(1900);\n;// CONCATENATED MODULE: ./src/components/parametre/Parametre.vue\n\n\n\n;\n\n\n/* normalize component */\n\nvar component = (0,componentNormalizer/* default */.Z)(\n  parametre_Parametrevue_type_script_lang_js_,\n  render,\n  staticRenderFns,\n  false,\n  null,\n  \"5e72fac8\",\n  null\n  \n)\n\n/* harmony default export */ var Parametre = (component.exports);//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly9zcmNfaHRtbHBob25lLy4vc3JjL2NvbXBvbmVudHMvcGFyYW1ldHJlL1BhcmFtZXRyZS52dWU/ZjY5ZSIsIndlYnBhY2s6Ly9zcmNfaHRtbHBob25lL3NyYy9jb21wb25lbnRzL3BhcmFtZXRyZS9QYXJhbWV0cmUudnVlPzlmY2YiLCJ3ZWJwYWNrOi8vc3JjX2h0bWxwaG9uZS8uL3NyYy9jb21wb25lbnRzL3BhcmFtZXRyZS9QYXJhbWV0cmUudnVlPzIxMzUiLCJ3ZWJwYWNrOi8vc3JjX2h0bWxwaG9uZS8uL3NyYy9jb21wb25lbnRzL3BhcmFtZXRyZS9QYXJhbWV0cmUudnVlP2JmODYiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7O0FBQUEsMEJBQTBCLGFBQWEsMEJBQTBCLHdCQUF3QixpQkFBaUIsd0JBQXdCLG1CQUFtQixPQUFPLDJDQUEyQyxLQUFLLHdCQUF3Qix3QkFBd0IscUNBQXFDLDRDQUE0QyxpQkFBaUIscUNBQXFDLG1DQUFtQyxLQUFLLHlCQUF5Qix5QkFBeUIsOEJBQThCLFlBQVksaUJBQWlCLHdCQUF3QixPQUFPLDJCQUEyQixLQUFLLHlCQUF5Qix5QkFBeUIsOEJBQThCLDRCQUE0QixrQ0FBa0MseUJBQXlCLHlCQUF5Qiw4QkFBOEIsYUFBYSxnQ0FBZ0MseUJBQXlCLHlCQUF5Qiw4QkFBOEIsbUVBQW1FLGdDQUFnQyx5QkFBeUIseUJBQXlCLDhCQUE4Qiw0Q0FBNEMsd0JBQXdCLHNCQUFzQixZQUFZLGlCQUFpQix3QkFBd0IsT0FBTyx3QkFBd0IsNEJBQTRCLDhCQUE4QixhQUFhLDRCQUE0Qix5RUFBeUUsNEJBQTRCO0FBQzM5Qzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztBQ3NEQTtBQUNBO0FBQ0E7QUFFQTtBQUNBO0FBQ0E7QUFEQSxHQURBO0FBSUEsTUFKQSxrQkFJQTtBQUNBO0FBQ0EsMkJBREE7QUFF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O0FBQ0E7QUFDQTtBQUNBOztBQUVBOztBQUVBLDhDQUFlLGlCIiwiZmlsZSI6IjQxMzkuanMiLCJzb3VyY2VzQ29udGVudCI6WyJ2YXIgcmVuZGVyID0gZnVuY3Rpb24gKCkge3ZhciBfdm09dGhpczt2YXIgX2g9X3ZtLiRjcmVhdGVFbGVtZW50O3ZhciBfYz1fdm0uX3NlbGYuX2N8fF9oO3JldHVybiBfYygnZGl2Jyx7c3RhdGljQ2xhc3M6XCJwaG9uZV9hcHBcIn0sW19jKCdQaG9uZVRpdGxlJyx7YXR0cnM6e1widGl0bGVcIjpfdm0uSW50bFN0cmluZygnQVBQX0NPTkZJR19USVRMRScpfSxvbjp7XCJiYWNrXCI6X3ZtLm9uQmFja3NwYWNlfX0pLF92bS5fdihcIiBcIiksX2MoJ2Rpdicse3N0YXRpY0NsYXNzOlwicGhvbmVfY29udGVudCBlbGVtZW50c1wifSxbX3ZtLl9sKChfdm0ucGFyYW1MaXN0KSxmdW5jdGlvbihlbGVtLGtleSl7cmV0dXJuIF9jKCdkaXYnLHtrZXk6a2V5LHN0YXRpY0NsYXNzOlwiZWxlbWVudFwiLGNsYXNzOnsgc2VsZWN0OiBrZXkgPT09IF92bS5jdXJyZW50U2VsZWN0fSxvbjp7XCJjbGlja1wiOmZ1bmN0aW9uKCRldmVudCl7JGV2ZW50LnN0b3BQcm9wYWdhdGlvbigpO3JldHVybiBfdm0ub25QcmVzc0l0ZW0oa2V5KX19fSxbX2MoJ2Rpdicse3N0YXRpY0NsYXNzOlwiZmFcIn0sW19jKCdGb250QXdlc29tZUljb24nLHthdHRyczp7XCJpY29uXCI6WydmYXMnLCBlbGVtLmljb25zXX0sb246e1wiY2xpY2tcIjpmdW5jdGlvbigkZXZlbnQpeyRldmVudC5zdG9wUHJvcGFnYXRpb24oKTtyZXR1cm4gX3ZtLm9uUHJlc3NJdGVtKGtleSl9fX0pXSwxKSxfdm0uX3YoXCIgXCIpLF9jKCdkaXYnLHtzdGF0aWNDbGFzczpcImVsZW1lbnQtY29udGVudFwiLG9uOntcImNsaWNrXCI6ZnVuY3Rpb24oJGV2ZW50KXskZXZlbnQuc3RvcFByb3BhZ2F0aW9uKCk7cmV0dXJuIF92bS5vblByZXNzSXRlbShrZXkpfX19LFtfYygnc3Bhbicse3N0YXRpY0NsYXNzOlwiZWxlbWVudC10aXRsZVwiLG9uOntcImNsaWNrXCI6ZnVuY3Rpb24oJGV2ZW50KXskZXZlbnQuc3RvcFByb3BhZ2F0aW9uKCk7cmV0dXJuIF92bS5vblByZXNzSXRlbShrZXkpfX19LFtfdm0uX3YoX3ZtLl9zKGVsZW0udGl0bGUpKV0pLF92bS5fdihcIiBcIiksKGVsZW0udmFsdWUpP19jKCdzcGFuJyx7c3RhdGljQ2xhc3M6XCJlbGVtZW50LXZhbHVlXCIsb246e1wiY2xpY2tcIjpmdW5jdGlvbigkZXZlbnQpeyRldmVudC5zdG9wUHJvcGFnYXRpb24oKTtyZXR1cm4gX3ZtLm9uUHJlc3NJdGVtKGtleSl9fX0sW192bS5fdihfdm0uX3MoZWxlbS52YWx1ZSkpXSk6X3ZtLl9lKCldKV0pfSksX3ZtLl92KFwiIFwiKSxfYygnZGl2Jyx7c3RhdGljQ2xhc3M6XCJlbGVtZW50XCJ9LFtfYygnZGl2Jyx7c3RhdGljQ2xhc3M6XCJmYVwifSxbX2MoJ0ZvbnRBd2Vzb21lSWNvbicse2F0dHJzOntcImljb25cIjpbJ2ZhcycsICd1bmRvJ119fSldLDEpLF92bS5fdihcIiBcIiksX2MoJ2Rpdicse3N0YXRpY0NsYXNzOlwiZWxlbWVudC1jb250ZW50XCJ9LFtfYygnc3Bhbicse3N0YXRpY0NsYXNzOlwiZWxlbWVudC10aXRsZVwifSxbX3ZtLl92KFwiXFxuICAgICAgICAgIFBob25lIFZlcnNpb25cXG4gICAgICAgIFwiKV0pLF92bS5fdihcIiBcIiksX2MoJ3NwYW4nLHtzdGF0aWNDbGFzczpcImVsZW1lbnQtdmFsdWVcIn0sW192bS5fdihfdm0uX3MoX3ZtLmN1cnJlbnRWZXJzaW9uKSldKV0pXSldLDIpXSwxKX1cbnZhciBzdGF0aWNSZW5kZXJGbnMgPSBbXVxuXG5leHBvcnQgeyByZW5kZXIsIHN0YXRpY1JlbmRlckZucyB9IiwiPHRlbXBsYXRlPlxuICA8ZGl2IGNsYXNzPVwicGhvbmVfYXBwXCI+XG4gICAgPFBob25lVGl0bGVcbiAgICAgIDp0aXRsZT1cIkludGxTdHJpbmcoJ0FQUF9DT05GSUdfVElUTEUnKVwiXG4gICAgICBAYmFjaz1cIm9uQmFja3NwYWNlXCJcbiAgICAvPlxuICAgIDxkaXYgY2xhc3M9XCJwaG9uZV9jb250ZW50IGVsZW1lbnRzXCI+XG4gICAgICA8ZGl2XG4gICAgICAgIHYtZm9yPVwiKGVsZW0sIGtleSkgaW4gcGFyYW1MaXN0XCJcbiAgICAgICAgOmtleT1cImtleVwiXG4gICAgICAgIGNsYXNzPVwiZWxlbWVudFwiXG4gICAgICAgIDpjbGFzcz1cInsgc2VsZWN0OiBrZXkgPT09IGN1cnJlbnRTZWxlY3R9XCJcbiAgICAgICAgQGNsaWNrLnN0b3A9XCJvblByZXNzSXRlbShrZXkpXCJcbiAgICAgID5cbiAgICAgICAgPGRpdiBjbGFzcz1cImZhXCI+XG4gICAgICAgICAgPEZvbnRBd2Vzb21lSWNvblxuICAgICAgICAgICAgOmljb249XCJbJ2ZhcycsIGVsZW0uaWNvbnNdXCJcbiAgICAgICAgICAgIEBjbGljay5zdG9wPVwib25QcmVzc0l0ZW0oa2V5KVwiXG4gICAgICAgICAgLz5cbiAgICAgICAgPC9kaXY+XG4gICAgICAgIDxkaXZcbiAgICAgICAgICBjbGFzcz1cImVsZW1lbnQtY29udGVudFwiXG4gICAgICAgICAgQGNsaWNrLnN0b3A9XCJvblByZXNzSXRlbShrZXkpXCJcbiAgICAgICAgPlxuICAgICAgICAgIDxzcGFuXG4gICAgICAgICAgICBjbGFzcz1cImVsZW1lbnQtdGl0bGVcIlxuICAgICAgICAgICAgQGNsaWNrLnN0b3A9XCJvblByZXNzSXRlbShrZXkpXCJcbiAgICAgICAgICA+e3sgZWxlbS50aXRsZSB9fTwvc3Bhbj5cbiAgICAgICAgICA8c3BhblxuICAgICAgICAgICAgdi1pZj1cImVsZW0udmFsdWVcIlxuICAgICAgICAgICAgY2xhc3M9XCJlbGVtZW50LXZhbHVlXCJcbiAgICAgICAgICAgIEBjbGljay5zdG9wPVwib25QcmVzc0l0ZW0oa2V5KVwiXG4gICAgICAgICAgPnt7IGVsZW0udmFsdWUgfX08L3NwYW4+XG4gICAgICAgIDwvZGl2PlxuICAgICAgPC9kaXY+XG4gICAgICA8ZGl2IGNsYXNzPVwiZWxlbWVudFwiPlxuICAgICAgICA8ZGl2IGNsYXNzPVwiZmFcIj5cbiAgICAgICAgICA8Rm9udEF3ZXNvbWVJY29uXG4gICAgICAgICAgICA6aWNvbj1cIlsnZmFzJywgJ3VuZG8nXVwiXG4gICAgICAgICAgLz5cbiAgICAgICAgPC9kaXY+XG4gICAgICAgIDxkaXZcbiAgICAgICAgICBjbGFzcz1cImVsZW1lbnQtY29udGVudFwiXG4gICAgICAgID5cbiAgICAgICAgICA8c3BhbiBjbGFzcz1cImVsZW1lbnQtdGl0bGVcIj5cbiAgICAgICAgICAgIFBob25lIFZlcnNpb25cbiAgICAgICAgICA8L3NwYW4+XG4gICAgICAgICAgPHNwYW4gY2xhc3M9XCJlbGVtZW50LXZhbHVlXCI+e3sgY3VycmVudFZlcnNpb24gfX08L3NwYW4+XG4gICAgICAgIDwvZGl2PlxuICAgICAgPC9kaXY+XG4gICAgPC9kaXY+XG4gIDwvZGl2PlxuPC90ZW1wbGF0ZT5cblxuPHNjcmlwdD5cbmltcG9ydCB7IG1hcEdldHRlcnMsIG1hcEFjdGlvbnMgfSBmcm9tICd2dWV4J1xuaW1wb3J0IFBob25lVGl0bGUgZnJvbSAnLi8uLi9QaG9uZVRpdGxlJ1xuaW1wb3J0IE1vZGFsIGZyb20gJ0AvY29tcG9uZW50cy9Nb2RhbC9pbmRleC5qcydcblxuZXhwb3J0IGRlZmF1bHQge1xuICBjb21wb25lbnRzOiB7XG4gICAgUGhvbmVUaXRsZVxuICB9LFxuICBkYXRhICgpIHtcbiAgICByZXR1cm4ge1xuICAgICAgY3VycmVudFZlcnNpb246IFwiMS4wXCIsXG4gICAgICBpZ25vcmVDb250cm9sczogZmFsc2UsXG4gICAgICBjdXJyZW50U2VsZWN0OiAwXG4gICAgfVxuICB9LFxuICBjb21wdXRlZDoge1xuICAgIC4uLm1hcEdldHRlcnMoWydJbnRsU3RyaW5nJywgJ3VzZU1vdXNlJywgJ215UGhvbmVOdW1iZXInLCAnYmFja2dyb3VuZExhYmVsJywgJ2NvcXVlTGFiZWwnLCAnc29uaWRvTGFiZWwnLCAnem9vbScsICdjb25maWcnLCAndm9sdW1lJywgJ2F2YWlsYWJsZUxhbmd1YWdlcyddKSxcbiAgICBwYXJhbUxpc3QgKCkge1xuICAgICAgY29uc3QgY2FuY2VsU3RyID0gdGhpcy5JbnRsU3RyaW5nKCdDQU5DRUwnKVxuICAgICAgY29uc3QgY29uZmlybVJlc2V0U3RyID0gdGhpcy5JbnRsU3RyaW5nKCdBUFBfQ09ORklHX1JFU0VUX0NPTkZJUk0nKVxuICAgICAgY29uc3QgY2FuY2VsT3B0aW9uID0ge31cbiAgICAgIGNvbnN0IGNvbmZpcm1SZXNldCA9IHt9XG4gICAgICBjYW5jZWxPcHRpb25bY2FuY2VsU3RyXSA9ICdjYW5jZWwnXG4gICAgICBjb25maXJtUmVzZXRbY29uZmlybVJlc2V0U3RyXSA9ICdhY2NlcHQnXG4gICAgICByZXR1cm4gW1xuICAgICAgICB7XG4gICAgICAgICAgaWNvbnM6ICdwaG9uZScsXG4gICAgICAgICAgdGl0bGU6IHRoaXMuSW50bFN0cmluZygnQVBQX0NPTkZJR19NWV9NVU5CRVInKSxcbiAgICAgICAgICB2YWx1ZTogdGhpcy5teVBob25lTnVtYmVyXG4gICAgICAgIH0sXG4gICAgICAgIHtcbiAgICAgICAgICBpY29uczogJ2ltYWdlJyxcbiAgICAgICAgICB0aXRsZTogdGhpcy5JbnRsU3RyaW5nKCdBUFBfQ09ORklHX1dBTExQQVBFUicpLFxuICAgICAgICAgIHZhbHVlOiB0aGlzLmJhY2tncm91bmRMYWJlbCxcbiAgICAgICAgICBvblZhbGlkOiAnb25DaGFuZ2VCYWNrZ3JvdW5kJyxcbiAgICAgICAgICB2YWx1ZXM6IHRoaXMuY29uZmlnLmJhY2tncm91bmRcbiAgICAgICAgfSxcbiAgICAgICAge1xuICAgICAgICAgIGljb25zOiAnbW9iaWxlJyxcbiAgICAgICAgICB0aXRsZTogdGhpcy5JbnRsU3RyaW5nKCdBUFBfQ09ORklHX0NBU0UnKSxcbiAgICAgICAgICB2YWx1ZTogdGhpcy5jb3F1ZUxhYmVsLFxuICAgICAgICAgIG9uVmFsaWQ6ICdvbkNoYW5nZUNvcXVlJyxcbiAgICAgICAgICB2YWx1ZXM6IHRoaXMuY29uZmlnLmNvcXVlXG4gICAgICAgIH0sXG4gICAgICAgIHtcbiAgICAgICAgICBpY29uczogJ2JlbGwnLFxuICAgICAgICAgIHRpdGxlOiB0aGlzLkludGxTdHJpbmcoJ0FQUF9DT05GSUdfU09VTkQnKSxcbiAgICAgICAgICB2YWx1ZTogdGhpcy5zb25pZG9MYWJlbCxcbiAgICAgICAgICBvblZhbGlkOiAnb25DaGFuZ2VTb25pZG8nLFxuICAgICAgICAgIHZhbHVlczogdGhpcy5jb25maWcuc29uaWRvXG4gICAgICAgIH0sXG4gICAgICAgIHtcbiAgICAgICAgICBpY29uczogJ3NlYXJjaCcsXG4gICAgICAgICAgdGl0bGU6IHRoaXMuSW50bFN0cmluZygnQVBQX0NPTkZJR19aT09NJyksXG4gICAgICAgICAgdmFsdWU6IHRoaXMuem9vbSxcbiAgICAgICAgICBvblZhbGlkOiAnc2V0Wm9vbScsXG4gICAgICAgICAgb25MZWZ0OiB0aGlzLmFqdXN0Wm9vbSgtMSksXG4gICAgICAgICAgb25SaWdodDogdGhpcy5hanVzdFpvb20oMSksXG4gICAgICAgICAgdmFsdWVzOiB7XG4gICAgICAgICAgICAnMTI1ICUnOiAnMTI1JScsXG4gICAgICAgICAgICAnMTAwICUnOiAnMTAwJScsXG4gICAgICAgICAgICAnODAgJSc6ICc4MCUnLFxuICAgICAgICAgICAgJzYwICUnOiAnNjAlJyxcbiAgICAgICAgICAgICc0MCAlJzogJzQwJScsXG4gICAgICAgICAgICAnMjAgJSc6ICcyMCUnXG4gICAgICAgICAgfVxuICAgICAgICB9LFxuICAgICAgICB7XG4gICAgICAgICAgaWNvbnM6ICd2b2x1bWUtZG93bicsXG4gICAgICAgICAgdGl0bGU6IHRoaXMuSW50bFN0cmluZygnQVBQX0NPTkZJR19WT0xVTUUnKSxcbiAgICAgICAgICB2YWx1ZTogdGhpcy52YWx1bWVEaXNwbGF5LFxuICAgICAgICAgIG9uVmFsaWQ6ICdzZXRQaG9uZVZvbHVtZScsXG4gICAgICAgICAgb25MZWZ0OiB0aGlzLmFqdXN0Vm9sdW1lKC0wLjAxKSxcbiAgICAgICAgICBvblJpZ2h0OiB0aGlzLmFqdXN0Vm9sdW1lKDAuMDEpLFxuICAgICAgICAgIHZhbHVlczoge1xuICAgICAgICAgICAgJzEwMCAlJzogMSxcbiAgICAgICAgICAgICc4MCAlJzogMC44LFxuICAgICAgICAgICAgJzYwICUnOiAwLjYsXG4gICAgICAgICAgICAnNDAgJSc6IDAuNCxcbiAgICAgICAgICAgICcyMCAlJzogMC4yLFxuICAgICAgICAgICAgJzAgJSc6IDBcbiAgICAgICAgICB9XG4gICAgICAgIH0sXG4gICAgICAgIHtcbiAgICAgICAgICBpY29uczogJ2dsb2JlLWFtZXJpY2FzJyxcbiAgICAgICAgICB0aXRsZTogdGhpcy5JbnRsU3RyaW5nKCdBUFBfQ09ORklHX0xBTkdVQUdFJyksXG4gICAgICAgICAgb25WYWxpZDogJ29uQ2hhbmdlTGFuZ3VhZ2VzJyxcbiAgICAgICAgICB2YWx1ZXM6IHtcbiAgICAgICAgICAgIC4uLnRoaXMuYXZhaWxhYmxlTGFuZ3VhZ2VzLFxuICAgICAgICAgICAgLi4uY2FuY2VsT3B0aW9uXG4gICAgICAgICAgfVxuICAgICAgICB9LFxuICAgICAgICB7XG4gICAgICAgICAgaWNvbnM6ICdtb3VzZS1wb2ludGVyJyxcbiAgICAgICAgICB0aXRsZTogdGhpcy5JbnRsU3RyaW5nKCdBUFBfQ09ORklHX01PVVNFX1NVUFBPUlQnKSxcbiAgICAgICAgICBvblZhbGlkOiAnb25DaGFuZ2VNb3VzZVN1cHBvcnQnLFxuICAgICAgICAgIHZhbHVlczoge1xuICAgICAgICAgICAgJ1llcyc6IHRydWUsXG4gICAgICAgICAgICAnTm8nOiBmYWxzZSxcbiAgICAgICAgICAgIC4uLmNhbmNlbE9wdGlvblxuICAgICAgICAgIH1cbiAgICAgICAgfSxcbiAgICAgICAge1xuICAgICAgICAgIGljb25zOiAnZXhjbGFtYXRpb24tdHJpYW5nbGUnLFxuICAgICAgICAgIGNvbG9yOiAnI2VlMzgzOCcsXG4gICAgICAgICAgdGl0bGU6IHRoaXMuSW50bFN0cmluZygnQVBQX0NPTkZJR19SRVNFVCcpLFxuICAgICAgICAgIG9uVmFsaWQ6ICdyZXNldFBob25lJyxcbiAgICAgICAgICB2YWx1ZXM6IHtcbiAgICAgICAgICAgIC4uLmNvbmZpcm1SZXNldCxcbiAgICAgICAgICAgIC4uLmNhbmNlbE9wdGlvblxuICAgICAgICAgIH1cbiAgICAgICAgfVxuICAgICAgXVxuICAgIH0sXG4gICAgdmFsdW1lRGlzcGxheSAoKSB7XG4gICAgICByZXR1cm4gYCR7TWF0aC5mbG9vcih0aGlzLnZvbHVtZSAqIDEwMCl9ICVgXG4gICAgfVxuICB9LFxuICBjcmVhdGVkICgpIHtcbiAgICBpZiAoIXRoaXMudXNlTW91c2UpIHtcbiAgICAgIHRoaXMuJGJ1cy4kb24oJ2tleVVwQXJyb3dSaWdodCcsIHRoaXMub25SaWdodClcbiAgICAgIHRoaXMuJGJ1cy4kb24oJ2tleVVwQXJyb3dMZWZ0JywgdGhpcy5vbkxlZnQpXG4gICAgICB0aGlzLiRidXMuJG9uKCdrZXlVcEFycm93RG93bicsIHRoaXMub25Eb3duKVxuICAgICAgdGhpcy4kYnVzLiRvbigna2V5VXBBcnJvd1VwJywgdGhpcy5vblVwKVxuICAgICAgdGhpcy4kYnVzLiRvbigna2V5VXBFbnRlcicsIHRoaXMub25FbnRlcilcbiAgICB9IGVsc2Uge1xuICAgICAgdGhpcy5jdXJyZW50U2VsZWN0ID0gLTFcbiAgICB9XG4gICAgdGhpcy4kYnVzLiRvbigna2V5VXBCYWNrc3BhY2UnLCB0aGlzLm9uQmFja3NwYWNlKVxuICB9LFxuICBiZWZvcmVEZXN0cm95ICgpIHtcbiAgICB0aGlzLiRidXMuJG9mZigna2V5VXBBcnJvd1JpZ2h0JywgdGhpcy5vblJpZ2h0KVxuICAgIHRoaXMuJGJ1cy4kb2ZmKCdrZXlVcEFycm93TGVmdCcsIHRoaXMub25MZWZ0KVxuICAgIHRoaXMuJGJ1cy4kb2ZmKCdrZXlVcEFycm93RG93bicsIHRoaXMub25Eb3duKVxuICAgIHRoaXMuJGJ1cy4kb2ZmKCdrZXlVcEFycm93VXAnLCB0aGlzLm9uVXApXG4gICAgdGhpcy4kYnVzLiRvZmYoJ2tleVVwRW50ZXInLCB0aGlzLm9uRW50ZXIpXG4gICAgdGhpcy4kYnVzLiRvZmYoJ2tleVVwQmFja3NwYWNlJywgdGhpcy5vbkJhY2tzcGFjZSlcbiAgfSxcbiAgbWV0aG9kczoge1xuICAgIC4uLm1hcEFjdGlvbnMoWydnZXRJbnRsU3RyaW5nJywgJ3NldFpvb24nLCAnc2V0QmFja2dyb3VuZCcsICdzZXRDb3F1ZScsICdzZXRTb25pZG8nLCAnc2V0Vm9sdW1lJywgJ3NldExhbmd1YWdlJywgJ3NldE1vdXNlU3VwcG9ydCddKSxcbiAgICBzY3JvbGxJbnRvVmlld0lmTmVlZGVkOiBmdW5jdGlvbiAoKSB7XG4gICAgICB0aGlzLiRuZXh0VGljaygoKSA9PiB7XG4gICAgICAgIGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3IoJy5zZWxlY3QnKS5zY3JvbGxJbnRvVmlld0lmTmVlZGVkKClcbiAgICAgIH0pXG4gICAgfSxcbiAgICBvbkJhY2tzcGFjZSAoKSB7XG4gICAgICBpZiAodGhpcy5pZ25vcmVDb250cm9scyA9PT0gdHJ1ZSkgcmV0dXJuXG4gICAgICB0aGlzLiRyb3V0ZXIucHVzaCh7IG5hbWU6ICdob21lJyB9KVxuICAgIH0sXG4gICAgb25VcDogZnVuY3Rpb24gKCkge1xuICAgICAgaWYgKHRoaXMuaWdub3JlQ29udHJvbHMgPT09IHRydWUpIHJldHVyblxuICAgICAgdGhpcy5jdXJyZW50U2VsZWN0ID0gdGhpcy5jdXJyZW50U2VsZWN0ID09PSAwID8gMCA6IHRoaXMuY3VycmVudFNlbGVjdCAtIDFcbiAgICAgIHRoaXMuc2Nyb2xsSW50b1ZpZXdJZk5lZWRlZCgpXG4gICAgfSxcbiAgICBvbkRvd246IGZ1bmN0aW9uICgpIHtcbiAgICAgIGlmICh0aGlzLmlnbm9yZUNvbnRyb2xzID09PSB0cnVlKSByZXR1cm5cbiAgICAgIHRoaXMuY3VycmVudFNlbGVjdCA9IHRoaXMuY3VycmVudFNlbGVjdCA9PT0gdGhpcy5wYXJhbUxpc3QubGVuZ3RoIC0gMSA/IHRoaXMuY3VycmVudFNlbGVjdCA6IHRoaXMuY3VycmVudFNlbGVjdCArIDFcbiAgICAgIHRoaXMuc2Nyb2xsSW50b1ZpZXdJZk5lZWRlZCgpXG4gICAgfSxcbiAgICBvblJpZ2h0ICgpIHtcbiAgICAgIGlmICh0aGlzLmlnbm9yZUNvbnRyb2xzID09PSB0cnVlKSByZXR1cm5cbiAgICAgIGxldCBwYXJhbSA9IHRoaXMucGFyYW1MaXN0W3RoaXMuY3VycmVudFNlbGVjdF1cbiAgICAgIGlmIChwYXJhbS5vblJpZ2h0ICE9PSB1bmRlZmluZWQpIHtcbiAgICAgICAgcGFyYW0ub25SaWdodChwYXJhbSlcbiAgICAgIH1cbiAgICB9LFxuICAgIG9uTGVmdCAoKSB7XG4gICAgICBpZiAodGhpcy5pZ25vcmVDb250cm9scyA9PT0gdHJ1ZSkgcmV0dXJuXG4gICAgICBsZXQgcGFyYW0gPSB0aGlzLnBhcmFtTGlzdFt0aGlzLmN1cnJlbnRTZWxlY3RdXG4gICAgICBpZiAocGFyYW0ub25MZWZ0ICE9PSB1bmRlZmluZWQpIHtcbiAgICAgICAgcGFyYW0ub25MZWZ0KHBhcmFtKVxuICAgICAgfVxuICAgIH0sXG4gICAgYWN0aW9uSXRlbSAocGFyYW0pIHtcbiAgICAgIGlmIChwYXJhbS52YWx1ZXMgIT09IHVuZGVmaW5lZCkge1xuICAgICAgICB0aGlzLmlnbm9yZUNvbnRyb2xzID0gdHJ1ZVxuICAgICAgICBsZXQgY2hvaXggPSBPYmplY3Qua2V5cyhwYXJhbS52YWx1ZXMpLm1hcChrZXkgPT4ge1xuICAgICAgICAgIHJldHVybiB7dGl0bGU6IGtleSwgdmFsdWU6IHBhcmFtLnZhbHVlc1trZXldLCBwaWN0bzogcGFyYW0udmFsdWVzW2tleV19XG4gICAgICAgIH0pXG4gICAgICAgIE1vZGFsLkNyZWF0ZU1vZGFsKHtjaG9peH0pLnRoZW4ocmVwb25zZSA9PiB7XG4gICAgICAgICAgdGhpcy5pZ25vcmVDb250cm9scyA9IGZhbHNlXG4gICAgICAgICAgaWYgKHJlcG9uc2UudGl0bGUgPT09ICdjYW5jZWwnKSByZXR1cm5cbiAgICAgICAgICB0aGlzW3BhcmFtLm9uVmFsaWRdKHBhcmFtLCByZXBvbnNlKVxuICAgICAgICB9KVxuICAgICAgfVxuICAgIH0sXG4gICAgb25QcmVzc0l0ZW0gKGluZGV4KSB7XG4gICAgICB0aGlzLmFjdGlvbkl0ZW0odGhpcy5wYXJhbUxpc3RbaW5kZXhdKVxuICAgIH0sXG4gICAgb25FbnRlciAoKSB7XG4gICAgICBpZiAodGhpcy5pZ25vcmVDb250cm9scyA9PT0gdHJ1ZSkgcmV0dXJuXG4gICAgICB0aGlzLmFjdGlvbkl0ZW0odGhpcy5wYXJhbUxpc3RbdGhpcy5jdXJyZW50U2VsZWN0XSlcbiAgICB9LFxuICAgIGFzeW5jIG9uQ2hhbmdlQmFja2dyb3VuZCAocGFyYW0sIGRhdGEpIHtcbiAgICAgIGxldCB2YWwgPSBkYXRhLnZhbHVlXG4gICAgICBpZiAodmFsID09PSAnVVJMJykge1xuICAgICAgICB0aGlzLmlnbm9yZUNvbnRyb2xzID0gdHJ1ZVxuICAgICAgICBNb2RhbC5DcmVhdGVUZXh0TW9kYWwoe1xuICAgICAgICAgIHRleHQ6ICdodHRwczovL2kuaW1ndXIuY29tLydcbiAgICAgICAgfSkudGhlbih2YWx1ZVRleHQgPT4ge1xuICAgICAgICAgIGlmICh2YWx1ZVRleHQudGV4dCAhPT0gJycgJiYgdmFsdWVUZXh0LnRleHQgIT09IHVuZGVmaW5lZCAmJiB2YWx1ZVRleHQudGV4dCAhPT0gbnVsbCAmJiB2YWx1ZVRleHQudGV4dCAhPT0gJ2h0dHBzOi8vaS5pbWd1ci5jb20vJykge1xuICAgICAgICAgICAgdGhpcy5zZXRCYWNrZ3JvdW5kKHtcbiAgICAgICAgICAgICAgbGFiZWw6ICdDdXN0b20nLFxuICAgICAgICAgICAgICB2YWx1ZTogdmFsdWVUZXh0LnRleHRcbiAgICAgICAgICAgIH0pXG4gICAgICAgICAgfVxuICAgICAgICB9KS5maW5hbGx5KCgpID0+IHtcbiAgICAgICAgICB0aGlzLmlnbm9yZUNvbnRyb2xzID0gZmFsc2VcbiAgICAgICAgfSlcbiAgICAgIH0gZWxzZSB7XG4gICAgICAgIHRoaXMuc2V0QmFja2dyb3VuZCh7XG4gICAgICAgICAgbGFiZWw6IGRhdGEudGl0bGUsXG4gICAgICAgICAgdmFsdWU6IGRhdGEudmFsdWVcbiAgICAgICAgfSlcbiAgICAgIH1cbiAgICB9LFxuICAgIG9uQ2hhbmdlQ29xdWU6IGZ1bmN0aW9uIChwYXJhbSwgZGF0YSkge1xuICAgICAgdGhpcy5zZXRDb3F1ZSh7XG4gICAgICAgIGxhYmVsOiBkYXRhLnRpdGxlLFxuICAgICAgICB2YWx1ZTogZGF0YS52YWx1ZVxuICAgICAgfSlcbiAgICB9LFxuXG4gICAgb25DaGFuZ2VTb25pZG86IGZ1bmN0aW9uIChwYXJhbSwgZGF0YSkge1xuICAgICAgdGhpcy5zZXRTb25pZG8oe1xuICAgICAgICBsYWJlbDogZGF0YS50aXRsZSxcbiAgICAgICAgdmFsdWU6IGRhdGEudmFsdWVcbiAgICAgIH0pXG4gICAgfSxcblxuICAgIHNldFpvb206IGZ1bmN0aW9uIChwYXJhbSwgZGF0YSkge1xuICAgICAgdGhpcy5zZXRab29uKGRhdGEudmFsdWUpXG4gICAgfSxcbiAgICBhanVzdFpvb20gKGluYykge1xuICAgICAgcmV0dXJuICgpID0+IHtcbiAgICAgICAgY29uc3QgcGVyY2VudCA9IE1hdGgubWF4KDEwLCAocGFyc2VJbnQodGhpcy56b29tKSB8fCAxMDApICsgaW5jKVxuICAgICAgICB0aGlzLnNldFpvb24oYCR7cGVyY2VudH0lYClcbiAgICAgIH1cbiAgICB9LFxuICAgIHNldFBob25lVm9sdW1lIChwYXJhbSwgZGF0YSkge1xuICAgICAgdGhpcy5zZXRWb2x1bWUoZGF0YS52YWx1ZSlcbiAgICB9LFxuICAgIGFqdXN0Vm9sdW1lIChpbmMpIHtcbiAgICAgIHJldHVybiAoKSA9PiB7XG4gICAgICAgIGNvbnN0IG5ld1ZvbHVtZSA9IE1hdGgubWF4KDAsIE1hdGgubWluKDEsIHBhcnNlRmxvYXQodGhpcy52b2x1bWUpICsgaW5jKSlcbiAgICAgICAgdGhpcy5zZXRWb2x1bWUobmV3Vm9sdW1lKVxuICAgICAgfVxuICAgIH0sXG4gICAgb25DaGFuZ2VMYW5ndWFnZXMgKHBhcmFtLCBkYXRhKSB7XG4gICAgICBpZiAoZGF0YS52YWx1ZSAhPT0gJ2NhbmNlbCcpIHtcbiAgICAgICAgdGhpcy5zZXRMYW5ndWFnZShkYXRhLnZhbHVlKVxuICAgICAgfVxuICAgIH0sXG4gICAgb25DaGFuZ2VNb3VzZVN1cHBvcnQgKHBhcmFtLCBkYXRhKSB7XG4gICAgICBpZiAoZGF0YS52YWx1ZSAhPT0gJ2NhbmNlbCcpIHtcbiAgICAgICAgdGhpcy5zZXRNb3VzZVN1cHBvcnQoZGF0YS52YWx1ZSlcbiAgICAgICAgdGhpcy5vbkJhY2tzcGFjZSgpXG4gICAgICB9XG4gICAgfSxcbiAgICByZXNldFBob25lOiBmdW5jdGlvbiAocGFyYW0sIGRhdGEpIHtcbiAgICAgIGlmIChkYXRhLnZhbHVlICE9PSAnY2FuY2VsJykge1xuICAgICAgICB0aGlzLmlnbm9yZUNvbnRyb2xzID0gdHJ1ZVxuICAgICAgICBjb25zdCBjYW5jZWxTdHIgPSB0aGlzLkludGxTdHJpbmcoJ0NBTkNFTCcpXG4gICAgICAgIGNvbnN0IGNvbmZpcm1SZXNldFN0ciA9IHRoaXMuSW50bFN0cmluZygnQVBQX0NPTkZJR19SRVNFVF9DT05GSVJNJylcbiAgICAgICAgbGV0IGNob2l4ID0gW3t0aXRsZTogY2FuY2VsU3RyfSwge3RpdGxlOiBjYW5jZWxTdHJ9LCB7dGl0bGU6IGNvbmZpcm1SZXNldFN0ciwgY29sb3I6ICdyZWQnLCByZXNldDogdHJ1ZX0sIHt0aXRsZTogY2FuY2VsU3RyfSwge3RpdGxlOiBjYW5jZWxTdHJ9XVxuICAgICAgICBNb2RhbC5DcmVhdGVNb2RhbCh7Y2hvaXh9KS50aGVuKHJlcG9uc2UgPT4ge1xuICAgICAgICAgIHRoaXMuaWdub3JlQ29udHJvbHMgPSBmYWxzZVxuICAgICAgICAgIGlmIChyZXBvbnNlLnJlc2V0ID09PSB0cnVlKSB7XG4gICAgICAgICAgICB0aGlzLiRwaG9uZUFQSS5kZWxldGVBTEwoKVxuICAgICAgICAgIH1cbiAgICAgICAgfSlcbiAgICAgIH1cbiAgICB9XG4gIH0sXG59XG48L3NjcmlwdD5cblxuPHN0eWxlIHNjb3BlZD5cbi5lbGVtZW50e1xuICBoZWlnaHQ6IDU4cHg7XG4gIGxpbmUtaGVpZ2h0OiA1OHB4O1xuICBkaXNwbGF5OiBmbGV4O1xuICBhbGlnbi1pdGVtczogY2VudGVyO1xuICBwb3NpdGlvbjogcmVsYXRpdmU7XG59XG4uZWxlbWVudCAuZmF7XG4gIGNvbG9yOiAjMGI4MWZmO1xuICBtYXJnaW4tbGVmdDogNnB4O1xuICBoZWlnaHQ6IDUycHg7XG4gIHdpZHRoOiA1MnB4O1xuICB0ZXh0LWFsaWduOiBjZW50ZXI7XG4gIGxpbmUtaGVpZ2h0OiA1MnB4XG59XG4uZWxlbWVudC1jb250ZW50e1xuICBoZWlnaHQ6IDU4cHg7XG4gIHdpZHRoOiAxMDAlO1xuICBtYXJnaW4tbGVmdDogNnB4O1xuICBkaXNwbGF5OiBmbGV4O1xuICBmbGV4LWZsb3c6IGNvbHVtbjtcbiAganVzdGlmeS1jb250ZW50OiBjZW50ZXI7XG59XG4uZWxlbWVudC10aXRsZXtcbiAgZGlzcGxheTogYmxvY2s7XG4gIG1hcmdpbi10b3A6IDRweDtcbiAgaGVpZ2h0OiAyMnB4O1xuICBsaW5lLWhlaWdodDogMjJweDtcbiAgZm9udC1zaXplOiAyMHB4O1xuICBmb250LXdlaWdodDogMzAwO1xufVxuLmVsZW1lbnQtdmFsdWV7XG4gIGRpc3BsYXk6IGJsb2NrO1xuICBsaW5lLWhlaWdodDogMTZweDtcbiAgaGVpZ2h0OiA4cHg7XG4gIGZvbnQtc2l6ZTogMTRweDtcbiAgZm9udC13ZWlnaHQ6IDEwMDtcbiAgY29sb3I6ICM4MDgwODA7XG59XG4uZWxlbWVudC5zZWxlY3QsIC5lbGVtZW50OmhvdmVye1xuICAgYmFja2dyb3VuZC1jb2xvcjogI0RERDtcbn1cbjwvc3R5bGU+XG4iLCJpbXBvcnQgbW9kIGZyb20gXCItIS4uLy4uLy4uL25vZGVfbW9kdWxlcy9iYWJlbC1sb2FkZXIvbGliL2luZGV4LmpzIS4uLy4uLy4uL25vZGVfbW9kdWxlcy92dWUtbG9hZGVyL2xpYi9pbmRleC5qcz8/dnVlLWxvYWRlci1vcHRpb25zIS4vUGFyYW1ldHJlLnZ1ZT92dWUmdHlwZT1zY3JpcHQmbGFuZz1qcyZcIjsgZXhwb3J0IGRlZmF1bHQgbW9kOyBleHBvcnQgKiBmcm9tIFwiLSEuLi8uLi8uLi9ub2RlX21vZHVsZXMvYmFiZWwtbG9hZGVyL2xpYi9pbmRleC5qcyEuLi8uLi8uLi9ub2RlX21vZHVsZXMvdnVlLWxvYWRlci9saWIvaW5kZXguanM/P3Z1ZS1sb2FkZXItb3B0aW9ucyEuL1BhcmFtZXRyZS52dWU/dnVlJnR5cGU9c2NyaXB0Jmxhbmc9anMmXCIiLCJpbXBvcnQgeyByZW5kZXIsIHN0YXRpY1JlbmRlckZucyB9IGZyb20gXCIuL1BhcmFtZXRyZS52dWU/dnVlJnR5cGU9dGVtcGxhdGUmaWQ9NWU3MmZhYzgmc2NvcGVkPXRydWUmXCJcbmltcG9ydCBzY3JpcHQgZnJvbSBcIi4vUGFyYW1ldHJlLnZ1ZT92dWUmdHlwZT1zY3JpcHQmbGFuZz1qcyZcIlxuZXhwb3J0ICogZnJvbSBcIi4vUGFyYW1ldHJlLnZ1ZT92dWUmdHlwZT1zY3JpcHQmbGFuZz1qcyZcIlxuaW1wb3J0IHN0eWxlMCBmcm9tIFwiLi9QYXJhbWV0cmUudnVlP3Z1ZSZ0eXBlPXN0eWxlJmluZGV4PTAmaWQ9NWU3MmZhYzgmc2NvcGVkPXRydWUmbGFuZz1jc3MmXCJcblxuXG4vKiBub3JtYWxpemUgY29tcG9uZW50ICovXG5pbXBvcnQgbm9ybWFsaXplciBmcm9tIFwiIS4uLy4uLy4uL25vZGVfbW9kdWxlcy92dWUtbG9hZGVyL2xpYi9ydW50aW1lL2NvbXBvbmVudE5vcm1hbGl6ZXIuanNcIlxudmFyIGNvbXBvbmVudCA9IG5vcm1hbGl6ZXIoXG4gIHNjcmlwdCxcbiAgcmVuZGVyLFxuICBzdGF0aWNSZW5kZXJGbnMsXG4gIGZhbHNlLFxuICBudWxsLFxuICBcIjVlNzJmYWM4XCIsXG4gIG51bGxcbiAgXG4pXG5cbmV4cG9ydCBkZWZhdWx0IGNvbXBvbmVudC5leHBvcnRzIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///4139\n")
        }
    }
]);