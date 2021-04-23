(self.webpackChunksrc_htmlphone=self.webpackChunksrc_htmlphone||[]).push([[5019],{5019:function(__unused_webpack_module,__webpack_exports__,__webpack_require__){"use strict";eval('// ESM COMPAT FLAG\n__webpack_require__.r(__webpack_exports__);\n\n// EXPORTS\n__webpack_require__.d(__webpack_exports__, {\n  "default": function() { return /* binding */ NotesMessage; }\n});\n\n;// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/Notes/NotesMessage.vue?vue&type=template&id=29501368&scoped=true&\nvar render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c(\'div\',{staticClass:"phone_app",staticStyle:{"width":"334px","height":"742px","background":"white"}},[_c(\'PhoneTitle\',{attrs:{"title":_vm.channelName,"background-color":"#f8d344"},on:{"back":_vm.onQuit}}),_vm._v(" "),_c(\'div\',{staticClass:"phone_content"},[_c(\'div\',{ref:"elementsDiv",staticClass:"elements"},_vm._l((_vm.notesMessages),function(elem){return _c(\'div\',{key:elem.id,staticClass:"element"},[_c(\'div\',{staticClass:"time"},[_vm._v("\\n          "+_vm._s(_vm.formatTime(elem.time))+"\\n        ")]),_vm._v(" "),_c(\'div\',{staticClass:"message"},[_vm._v("\\n          "+_vm._s(elem.message)+"\\n        ")])])}),0),_vm._v(" "),_c(\'div\',{staticClass:"notes_write"},[_c(\'label\',[_c(\'input\',{directives:[{name:"model",rawName:"v-model",value:(_vm.message),expression:"message"}],attrs:{"type":"text","placeholder":"..."},domProps:{"value":(_vm.message)},on:{"keyup":function($event){if(!$event.type.indexOf(\'key\')&&_vm._k($event.keyCode,"enter",13,$event.key,"Enter")){ return null; }$event.preventDefault();return _vm.sendMessage($event)},"input":function($event){if($event.target.composing){ return; }_vm.message=$event.target.value}}})]),_vm._v(" "),_c(\'span\',{staticClass:"notes_send",on:{"click":_vm.sendMessage}},[_vm._v(">")])])])],1)}\nvar staticRenderFns = []\n\n\n// EXTERNAL MODULE: ./node_modules/@babel/runtime/helpers/esm/asyncToGenerator.js\nvar asyncToGenerator = __webpack_require__(2137);\n// EXTERNAL MODULE: ./node_modules/@babel/runtime/helpers/esm/defineProperty.js\nvar defineProperty = __webpack_require__(6156);\n// EXTERNAL MODULE: ./node_modules/@babel/runtime/regenerator/index.js\nvar regenerator = __webpack_require__(7757);\nvar regenerator_default = /*#__PURE__*/__webpack_require__.n(regenerator);\n// EXTERNAL MODULE: ./node_modules/vuex/dist/vuex.esm.js\nvar vuex_esm = __webpack_require__(629);\n// EXTERNAL MODULE: ./src/components/PhoneTitle.vue + 3 modules\nvar PhoneTitle = __webpack_require__(5317);\n;// CONCATENATED MODULE: ./node_modules/babel-loader/lib/index.js!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/Notes/NotesMessage.vue?vue&type=script&lang=js&\n\n\n\n\nfunction ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }\n\nfunction _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { (0,defineProperty/* default */.Z)(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }\n\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n\n\n/* harmony default export */ var NotesMessagevue_type_script_lang_js_ = ({\n  components: {\n    PhoneTitle: PhoneTitle/* default */.Z\n  },\n  data: function data() {\n    return {\n      message: \'\',\n      channel: \'\',\n      currentSelect: 0\n    };\n  },\n  computed: _objectSpread(_objectSpread({}, (0,vuex_esm/* mapGetters */.Se)([\'notesMessages\', \'notesCurrentChannel\', \'useMouse\'])), {}, {\n    channelName: function channelName() {\n      return \'# \' + this.channel;\n    }\n  }),\n  watch: {\n    notesMessages: function notesMessages() {\n      var c = this.$refs.elementsDiv;\n      c.scrollTop = c.scrollHeight;\n    }\n  },\n  created: function created() {\n    if (!this.useMouse) {\n      this.$bus.$on(\'keyUpArrowDown\', this.onDown);\n      this.$bus.$on(\'keyUpArrowUp\', this.onUp);\n      this.$bus.$on(\'keyUpEnter\', this.onEnter);\n    } else {\n      this.currentSelect = -1;\n    }\n\n    this.$bus.$on(\'keyUpBackspace\', this.onBack);\n    this.setChannel(this.$route.params.channel);\n  },\n  mounted: function mounted() {\n    window.c = this.$refs.elementsDiv;\n    var c = this.$refs.elementsDiv;\n    c.scrollTop = c.scrollHeight;\n  },\n  beforeDestroy: function beforeDestroy() {\n    this.$bus.$off(\'keyUpArrowDown\', this.onDown);\n    this.$bus.$off(\'keyUpArrowUp\', this.onUp);\n    this.$bus.$off(\'keyUpEnter\', this.onEnter);\n    this.$bus.$off(\'keyUpBackspace\', this.onBack);\n  },\n  methods: _objectSpread(_objectSpread({\n    setChannel: function setChannel(channel) {\n      this.channel = channel;\n      this.notesSetChannel({\n        channel: channel\n      });\n    }\n  }, (0,vuex_esm/* mapActions */.nv)([\'notesSetChannel\', \'notesSendMessage\'])), {}, {\n    scrollIntoViewIfNeeded: function scrollIntoViewIfNeeded() {\n      var _this = this;\n\n      this.$nextTick(function () {\n        var $select = _this.$el.querySelector(\'.select\');\n\n        if ($select !== null) {\n          $select.scrollIntoViewIfNeeded();\n        }\n      });\n    },\n    onUp: function onUp() {\n      var c = this.$refs.elementsDiv;\n      c.scrollTop = c.scrollTop - 120;\n    },\n    onDown: function onDown() {\n      var c = this.$refs.elementsDiv;\n      c.scrollTop = c.scrollTop + 120;\n    },\n    onEnter: function onEnter() {\n      var _this2 = this;\n\n      return (0,asyncToGenerator/* default */.Z)( /*#__PURE__*/regenerator_default().mark(function _callee() {\n        var rep, message;\n        return regenerator_default().wrap(function _callee$(_context) {\n          while (1) {\n            switch (_context.prev = _context.next) {\n              case 0:\n                _context.next = 2;\n                return _this2.$phoneAPI.getReponseText();\n\n              case 2:\n                rep = _context.sent;\n\n                if (rep !== undefined && rep.text !== undefined) {\n                  message = rep.text.trim();\n\n                  if (message.length !== 0) {\n                    _this2.notesSendMessage({\n                      channel: _this2.channel,\n                      message: message\n                    });\n                  }\n                }\n\n              case 4:\n              case "end":\n                return _context.stop();\n            }\n          }\n        }, _callee);\n      }))();\n    },\n    sendMessage: function sendMessage() {\n      var message = this.message.trim();\n\n      if (message.length !== 0) {\n        this.notesSendMessage({\n          channel: this.channel,\n          message: message\n        });\n        this.message = \'\';\n      }\n    },\n    onBack: function onBack() {\n      if (this.useMouse === true && document.activeElement.tagName !== \'BODY\') return;\n      this.onQuit();\n    },\n    onQuit: function onQuit() {\n      this.$router.push({\n        name: \'notes.channel\'\n      });\n    },\n    formatTime: function formatTime(time) {\n      var d = new Date(time);\n      return d.toLocaleTimeString();\n    }\n  })\n});\n;// CONCATENATED MODULE: ./src/components/Notes/NotesMessage.vue?vue&type=script&lang=js&\n /* harmony default export */ var Notes_NotesMessagevue_type_script_lang_js_ = (NotesMessagevue_type_script_lang_js_); \n// EXTERNAL MODULE: ./node_modules/vue-loader/lib/runtime/componentNormalizer.js\nvar componentNormalizer = __webpack_require__(1900);\n;// CONCATENATED MODULE: ./src/components/Notes/NotesMessage.vue\n\n\n\n;\n\n\n/* normalize component */\n\nvar component = (0,componentNormalizer/* default */.Z)(\n  Notes_NotesMessagevue_type_script_lang_js_,\n  render,\n  staticRenderFns,\n  false,\n  null,\n  "29501368",\n  null\n  \n)\n\n/* harmony default export */ var NotesMessage = (component.exports);//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly9zcmNfaHRtbHBob25lLy4vc3JjL2NvbXBvbmVudHMvTm90ZXMvTm90ZXNNZXNzYWdlLnZ1ZT82OWYwIiwid2VicGFjazovL3NyY19odG1scGhvbmUvc3JjL2NvbXBvbmVudHMvTm90ZXMvTm90ZXNNZXNzYWdlLnZ1ZT8xMDYxIiwid2VicGFjazovL3NyY19odG1scGhvbmUvLi9zcmMvY29tcG9uZW50cy9Ob3Rlcy9Ob3Rlc01lc3NhZ2UudnVlPzRhZmIiLCJ3ZWJwYWNrOi8vc3JjX2h0bWxwaG9uZS8uL3NyYy9jb21wb25lbnRzL05vdGVzL05vdGVzTWVzc2FnZS52dWU/YjE1NiJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7QUFBQSwwQkFBMEIsYUFBYSwwQkFBMEIsd0JBQXdCLGlCQUFpQixxQ0FBcUMsdURBQXVELG1CQUFtQixPQUFPLHFEQUFxRCxLQUFLLG1CQUFtQix3QkFBd0IsNEJBQTRCLFlBQVkseUNBQXlDLDJDQUEyQyxpQkFBaUIsa0NBQWtDLFlBQVksbUJBQW1CLGdHQUFnRyxzQkFBc0IsK0RBQStELDJCQUEyQiwwQkFBMEIsMEJBQTBCLGFBQWEsd0VBQXdFLFNBQVMsa0NBQWtDLFdBQVcsc0JBQXNCLEtBQUsseUJBQXlCLHNGQUFzRixhQUFhLEVBQUUsd0JBQXdCLCtCQUErQiwwQkFBMEIsNEJBQTRCLFFBQVEsRUFBRSxrQ0FBa0MsMkJBQTJCLDZCQUE2Qix5QkFBeUI7QUFDcnlDOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0FDK0NBO0FBQ0E7QUFFQTtBQUNBO0FBQUE7QUFBQSxHQURBO0FBRUEsTUFGQSxrQkFFQTtBQUNBO0FBQ0EsaUJBREE7QUFFQSxpQkFGQTtBQUdBO0FBSEE7QUFLQSxHQVJBO0FBU0EsNENBQ0EscUZBREE7QUFFQSxlQUZBLHlCQUVBO0FBQ0E7QUFDQTtBQUpBLElBVEE7QUFlQTtBQUNBLGlCQURBLDJCQUNBO0FBQ0E7QUFDQTtBQUNBO0FBSkEsR0FmQTtBQXFCQSxTQXJCQSxxQkFxQkE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEtBSkEsTUFJQTtBQUNBO0FBQ0E7O0FBQ0E7QUFDQTtBQUNBLEdBL0JBO0FBZ0NBLFNBaENBLHFCQWdDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEdBcENBO0FBcUNBLGVBckNBLDJCQXFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsR0ExQ0E7QUEyQ0E7QUFDQSxjQURBLHNCQUNBLE9BREEsRUFDQTtBQUNBO0FBQ0E7QUFBQTtBQUFBO0FBQ0E7QUFKQSxLQUtBLHdFQUxBO0FBTUEsMEJBTkEsb0NBTUE7QUFBQTs7QUFDQTtBQUNBOztBQUNBO0FBQ0E7QUFDQTtBQUNBLE9BTEE7QUFNQSxLQWJBO0FBY0EsUUFkQSxrQkFjQTtBQUNBO0FBQ0E7QUFDQSxLQWpCQTtBQWtCQSxVQWxCQSxvQkFrQkE7QUFDQTtBQUNBO0FBQ0EsS0FyQkE7QUFzQkEsV0F0QkEscUJBc0JBO0FBQUE7O0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQSx1QkFDQSxpQ0FEQTs7QUFBQTtBQUNBLG1CQURBOztBQUVBO0FBQ0EseUJBREEsR0FDQSxlQURBOztBQUVBO0FBQ0E7QUFDQSw2Q0FEQTtBQUVBO0FBRkE7QUFJQTtBQUNBOztBQVZBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBV0EsS0FqQ0E7QUFrQ0EsZUFsQ0EseUJBa0NBO0FBQ0E7O0FBQ0E7QUFDQTtBQUNBLCtCQURBO0FBRUE7QUFGQTtBQUlBO0FBQ0E7QUFDQSxLQTNDQTtBQTRDQSxVQTVDQSxvQkE0Q0E7QUFDQTtBQUNBO0FBQ0EsS0EvQ0E7QUFnREEsVUFoREEsb0JBZ0RBO0FBQ0E7QUFBQTtBQUFBO0FBQ0EsS0FsREE7QUFtREEsY0FuREEsc0JBbURBLElBbkRBLEVBbURBO0FBQ0E7QUFDQTtBQUNBO0FBdERBO0FBM0NBLEc7O0FDbkRrTCxDQUFDLCtFQUFlLG9DQUFHLEVBQUMsQzs7OztBQ0EvRjtBQUN2QztBQUNMO0FBQzNELENBQWdHOzs7QUFHaEc7QUFDNkY7QUFDN0YsZ0JBQWdCLHNDQUFVO0FBQzFCLEVBQUUsMENBQU07QUFDUixFQUFFLE1BQU07QUFDUixFQUFFLGVBQWU7QUFDakI7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7O0FBRUEsaURBQWUsaUIiLCJmaWxlIjoiNTAxOS5qcyIsInNvdXJjZXNDb250ZW50IjpbInZhciByZW5kZXIgPSBmdW5jdGlvbiAoKSB7dmFyIF92bT10aGlzO3ZhciBfaD1fdm0uJGNyZWF0ZUVsZW1lbnQ7dmFyIF9jPV92bS5fc2VsZi5fY3x8X2g7cmV0dXJuIF9jKCdkaXYnLHtzdGF0aWNDbGFzczpcInBob25lX2FwcFwiLHN0YXRpY1N0eWxlOntcIndpZHRoXCI6XCIzMzRweFwiLFwiaGVpZ2h0XCI6XCI3NDJweFwiLFwiYmFja2dyb3VuZFwiOlwid2hpdGVcIn19LFtfYygnUGhvbmVUaXRsZScse2F0dHJzOntcInRpdGxlXCI6X3ZtLmNoYW5uZWxOYW1lLFwiYmFja2dyb3VuZC1jb2xvclwiOlwiI2Y4ZDM0NFwifSxvbjp7XCJiYWNrXCI6X3ZtLm9uUXVpdH19KSxfdm0uX3YoXCIgXCIpLF9jKCdkaXYnLHtzdGF0aWNDbGFzczpcInBob25lX2NvbnRlbnRcIn0sW19jKCdkaXYnLHtyZWY6XCJlbGVtZW50c0RpdlwiLHN0YXRpY0NsYXNzOlwiZWxlbWVudHNcIn0sX3ZtLl9sKChfdm0ubm90ZXNNZXNzYWdlcyksZnVuY3Rpb24oZWxlbSl7cmV0dXJuIF9jKCdkaXYnLHtrZXk6ZWxlbS5pZCxzdGF0aWNDbGFzczpcImVsZW1lbnRcIn0sW19jKCdkaXYnLHtzdGF0aWNDbGFzczpcInRpbWVcIn0sW192bS5fdihcIlxcbiAgICAgICAgICBcIitfdm0uX3MoX3ZtLmZvcm1hdFRpbWUoZWxlbS50aW1lKSkrXCJcXG4gICAgICAgIFwiKV0pLF92bS5fdihcIiBcIiksX2MoJ2Rpdicse3N0YXRpY0NsYXNzOlwibWVzc2FnZVwifSxbX3ZtLl92KFwiXFxuICAgICAgICAgIFwiK192bS5fcyhlbGVtLm1lc3NhZ2UpK1wiXFxuICAgICAgICBcIildKV0pfSksMCksX3ZtLl92KFwiIFwiKSxfYygnZGl2Jyx7c3RhdGljQ2xhc3M6XCJub3Rlc193cml0ZVwifSxbX2MoJ2xhYmVsJyxbX2MoJ2lucHV0Jyx7ZGlyZWN0aXZlczpbe25hbWU6XCJtb2RlbFwiLHJhd05hbWU6XCJ2LW1vZGVsXCIsdmFsdWU6KF92bS5tZXNzYWdlKSxleHByZXNzaW9uOlwibWVzc2FnZVwifV0sYXR0cnM6e1widHlwZVwiOlwidGV4dFwiLFwicGxhY2Vob2xkZXJcIjpcIi4uLlwifSxkb21Qcm9wczp7XCJ2YWx1ZVwiOihfdm0ubWVzc2FnZSl9LG9uOntcImtleXVwXCI6ZnVuY3Rpb24oJGV2ZW50KXtpZighJGV2ZW50LnR5cGUuaW5kZXhPZigna2V5JykmJl92bS5faygkZXZlbnQua2V5Q29kZSxcImVudGVyXCIsMTMsJGV2ZW50LmtleSxcIkVudGVyXCIpKXsgcmV0dXJuIG51bGw7IH0kZXZlbnQucHJldmVudERlZmF1bHQoKTtyZXR1cm4gX3ZtLnNlbmRNZXNzYWdlKCRldmVudCl9LFwiaW5wdXRcIjpmdW5jdGlvbigkZXZlbnQpe2lmKCRldmVudC50YXJnZXQuY29tcG9zaW5nKXsgcmV0dXJuOyB9X3ZtLm1lc3NhZ2U9JGV2ZW50LnRhcmdldC52YWx1ZX19fSldKSxfdm0uX3YoXCIgXCIpLF9jKCdzcGFuJyx7c3RhdGljQ2xhc3M6XCJub3Rlc19zZW5kXCIsb246e1wiY2xpY2tcIjpfdm0uc2VuZE1lc3NhZ2V9fSxbX3ZtLl92KFwiPlwiKV0pXSldKV0sMSl9XG52YXIgc3RhdGljUmVuZGVyRm5zID0gW11cblxuZXhwb3J0IHsgcmVuZGVyLCBzdGF0aWNSZW5kZXJGbnMgfSIsIjx0ZW1wbGF0ZT5cbiAgPGRpdlxuICAgIHN0eWxlPVwid2lkdGg6IDMzNHB4OyBoZWlnaHQ6IDc0MnB4OyBiYWNrZ3JvdW5kOiB3aGl0ZVwiXG4gICAgY2xhc3M9XCJwaG9uZV9hcHBcIlxuICA+XG4gICAgPFBob25lVGl0bGVcbiAgICAgIDp0aXRsZT1cImNoYW5uZWxOYW1lXCJcbiAgICAgIGJhY2tncm91bmQtY29sb3I9XCIjZjhkMzQ0XCJcbiAgICAgIEBiYWNrPVwib25RdWl0XCJcbiAgICAvPlxuICAgIDxkaXYgY2xhc3M9XCJwaG9uZV9jb250ZW50XCI+XG4gICAgICA8ZGl2XG4gICAgICAgIHJlZj1cImVsZW1lbnRzRGl2XCJcbiAgICAgICAgY2xhc3M9XCJlbGVtZW50c1wiXG4gICAgICA+XG4gICAgICAgIDxkaXZcbiAgICAgICAgICB2LWZvcj1cIihlbGVtKSBpbiBub3Rlc01lc3NhZ2VzXCJcbiAgICAgICAgICA6a2V5PVwiZWxlbS5pZFwiXG4gICAgICAgICAgY2xhc3M9XCJlbGVtZW50XCJcbiAgICAgICAgPlxuICAgICAgICAgIDxkaXYgY2xhc3M9XCJ0aW1lXCI+XG4gICAgICAgICAgICB7eyBmb3JtYXRUaW1lKGVsZW0udGltZSkgfX1cbiAgICAgICAgICA8L2Rpdj5cbiAgICAgICAgICA8ZGl2IGNsYXNzPVwibWVzc2FnZVwiPlxuICAgICAgICAgICAge3sgZWxlbS5tZXNzYWdlIH19XG4gICAgICAgICAgPC9kaXY+XG4gICAgICAgIDwvZGl2PlxuICAgICAgPC9kaXY+XG5cbiAgICAgIDxkaXYgY2xhc3M9XCJub3Rlc193cml0ZVwiPlxuICAgICAgICA8bGFiZWw+XG4gICAgICAgICAgPGlucHV0XG4gICAgICAgICAgICB2LW1vZGVsPVwibWVzc2FnZVwiXG4gICAgICAgICAgICB0eXBlPVwidGV4dFwiXG4gICAgICAgICAgICBwbGFjZWhvbGRlcj1cIi4uLlwiXG4gICAgICAgICAgICBAa2V5dXAuZW50ZXIucHJldmVudD1cInNlbmRNZXNzYWdlXCJcbiAgICAgICAgICA+XG4gICAgICAgIDwvbGFiZWw+XG4gICAgICAgIDxzcGFuXG4gICAgICAgICAgY2xhc3M9XCJub3Rlc19zZW5kXCJcbiAgICAgICAgICBAY2xpY2s9XCJzZW5kTWVzc2FnZVwiXG4gICAgICAgID4+PC9zcGFuPlxuICAgICAgPC9kaXY+XG4gICAgPC9kaXY+XG4gIDwvZGl2PlxuPC90ZW1wbGF0ZT5cblxuPHNjcmlwdD5cbmltcG9ydCB7bWFwR2V0dGVycywgbWFwQWN0aW9uc30gZnJvbSAndnVleCdcbmltcG9ydCBQaG9uZVRpdGxlIGZyb20gJy4vLi4vUGhvbmVUaXRsZSdcblxuZXhwb3J0IGRlZmF1bHQge1xuICBjb21wb25lbnRzOiB7UGhvbmVUaXRsZX0sXG4gIGRhdGEoKSB7XG4gICAgcmV0dXJuIHtcbiAgICAgIG1lc3NhZ2U6ICcnLFxuICAgICAgY2hhbm5lbDogJycsXG4gICAgICBjdXJyZW50U2VsZWN0OiAwXG4gICAgfVxuICB9LFxuICBjb21wdXRlZDoge1xuICAgIC4uLm1hcEdldHRlcnMoWydub3Rlc01lc3NhZ2VzJywgJ25vdGVzQ3VycmVudENoYW5uZWwnLCAndXNlTW91c2UnXSksXG4gICAgY2hhbm5lbE5hbWUoKSB7XG4gICAgICByZXR1cm4gJyMgJyArIHRoaXMuY2hhbm5lbFxuICAgIH1cbiAgfSxcbiAgd2F0Y2g6IHtcbiAgICBub3Rlc01lc3NhZ2VzKCkge1xuICAgICAgY29uc3QgYyA9IHRoaXMuJHJlZnMuZWxlbWVudHNEaXZcbiAgICAgIGMuc2Nyb2xsVG9wID0gYy5zY3JvbGxIZWlnaHRcbiAgICB9XG4gIH0sXG4gIGNyZWF0ZWQoKSB7XG4gICAgaWYgKCF0aGlzLnVzZU1vdXNlKSB7XG4gICAgICB0aGlzLiRidXMuJG9uKCdrZXlVcEFycm93RG93bicsIHRoaXMub25Eb3duKVxuICAgICAgdGhpcy4kYnVzLiRvbigna2V5VXBBcnJvd1VwJywgdGhpcy5vblVwKVxuICAgICAgdGhpcy4kYnVzLiRvbigna2V5VXBFbnRlcicsIHRoaXMub25FbnRlcilcbiAgICB9IGVsc2Uge1xuICAgICAgdGhpcy5jdXJyZW50U2VsZWN0ID0gLTFcbiAgICB9XG4gICAgdGhpcy4kYnVzLiRvbigna2V5VXBCYWNrc3BhY2UnLCB0aGlzLm9uQmFjaylcbiAgICB0aGlzLnNldENoYW5uZWwodGhpcy4kcm91dGUucGFyYW1zLmNoYW5uZWwpXG4gIH0sXG4gIG1vdW50ZWQoKSB7XG4gICAgd2luZG93LmMgPSB0aGlzLiRyZWZzLmVsZW1lbnRzRGl2XG4gICAgY29uc3QgYyA9IHRoaXMuJHJlZnMuZWxlbWVudHNEaXZcbiAgICBjLnNjcm9sbFRvcCA9IGMuc2Nyb2xsSGVpZ2h0XG4gIH0sXG4gIGJlZm9yZURlc3Ryb3koKSB7XG4gICAgdGhpcy4kYnVzLiRvZmYoJ2tleVVwQXJyb3dEb3duJywgdGhpcy5vbkRvd24pXG4gICAgdGhpcy4kYnVzLiRvZmYoJ2tleVVwQXJyb3dVcCcsIHRoaXMub25VcClcbiAgICB0aGlzLiRidXMuJG9mZigna2V5VXBFbnRlcicsIHRoaXMub25FbnRlcilcbiAgICB0aGlzLiRidXMuJG9mZigna2V5VXBCYWNrc3BhY2UnLCB0aGlzLm9uQmFjaylcbiAgfSxcbiAgbWV0aG9kczoge1xuICAgIHNldENoYW5uZWwoY2hhbm5lbCkge1xuICAgICAgdGhpcy5jaGFubmVsID0gY2hhbm5lbFxuICAgICAgdGhpcy5ub3Rlc1NldENoYW5uZWwoe2NoYW5uZWx9KVxuICAgIH0sXG4gICAgLi4ubWFwQWN0aW9ucyhbJ25vdGVzU2V0Q2hhbm5lbCcsICdub3Rlc1NlbmRNZXNzYWdlJ10pLFxuICAgIHNjcm9sbEludG9WaWV3SWZOZWVkZWQoKSB7XG4gICAgICB0aGlzLiRuZXh0VGljaygoKSA9PiB7XG4gICAgICAgIGNvbnN0ICRzZWxlY3QgPSB0aGlzLiRlbC5xdWVyeVNlbGVjdG9yKCcuc2VsZWN0JylcbiAgICAgICAgaWYgKCRzZWxlY3QgIT09IG51bGwpIHtcbiAgICAgICAgICAkc2VsZWN0LnNjcm9sbEludG9WaWV3SWZOZWVkZWQoKVxuICAgICAgICB9XG4gICAgICB9KVxuICAgIH0sXG4gICAgb25VcCgpIHtcbiAgICAgIGNvbnN0IGMgPSB0aGlzLiRyZWZzLmVsZW1lbnRzRGl2XG4gICAgICBjLnNjcm9sbFRvcCA9IGMuc2Nyb2xsVG9wIC0gMTIwXG4gICAgfSxcbiAgICBvbkRvd24oKSB7XG4gICAgICBjb25zdCBjID0gdGhpcy4kcmVmcy5lbGVtZW50c0RpdlxuICAgICAgYy5zY3JvbGxUb3AgPSBjLnNjcm9sbFRvcCArIDEyMFxuICAgIH0sXG4gICAgYXN5bmMgb25FbnRlcigpIHtcbiAgICAgIGNvbnN0IHJlcCA9IGF3YWl0IHRoaXMuJHBob25lQVBJLmdldFJlcG9uc2VUZXh0KClcbiAgICAgIGlmIChyZXAgIT09IHVuZGVmaW5lZCAmJiByZXAudGV4dCAhPT0gdW5kZWZpbmVkKSB7XG4gICAgICAgIGNvbnN0IG1lc3NhZ2UgPSByZXAudGV4dC50cmltKClcbiAgICAgICAgaWYgKG1lc3NhZ2UubGVuZ3RoICE9PSAwKSB7XG4gICAgICAgICAgdGhpcy5ub3Rlc1NlbmRNZXNzYWdlKHtcbiAgICAgICAgICAgIGNoYW5uZWw6IHRoaXMuY2hhbm5lbCxcbiAgICAgICAgICAgIG1lc3NhZ2VcbiAgICAgICAgICB9KVxuICAgICAgICB9XG4gICAgICB9XG4gICAgfSxcbiAgICBzZW5kTWVzc2FnZSgpIHtcbiAgICAgIGNvbnN0IG1lc3NhZ2UgPSB0aGlzLm1lc3NhZ2UudHJpbSgpXG4gICAgICBpZiAobWVzc2FnZS5sZW5ndGggIT09IDApIHtcbiAgICAgICAgdGhpcy5ub3Rlc1NlbmRNZXNzYWdlKHtcbiAgICAgICAgICBjaGFubmVsOiB0aGlzLmNoYW5uZWwsXG4gICAgICAgICAgbWVzc2FnZVxuICAgICAgICB9KVxuICAgICAgICB0aGlzLm1lc3NhZ2UgPSAnJ1xuICAgICAgfVxuICAgIH0sXG4gICAgb25CYWNrKCkge1xuICAgICAgaWYgKHRoaXMudXNlTW91c2UgPT09IHRydWUgJiYgZG9jdW1lbnQuYWN0aXZlRWxlbWVudC50YWdOYW1lICE9PSAnQk9EWScpIHJldHVyblxuICAgICAgdGhpcy5vblF1aXQoKVxuICAgIH0sXG4gICAgb25RdWl0KCkge1xuICAgICAgdGhpcy4kcm91dGVyLnB1c2goe25hbWU6ICdub3Rlcy5jaGFubmVsJ30pXG4gICAgfSxcbiAgICBmb3JtYXRUaW1lKHRpbWUpIHtcbiAgICAgIGNvbnN0IGQgPSBuZXcgRGF0ZSh0aW1lKVxuICAgICAgcmV0dXJuIGQudG9Mb2NhbGVUaW1lU3RyaW5nKClcbiAgICB9XG4gIH0sXG59XG48L3NjcmlwdD5cblxuPHN0eWxlIHNjb3BlZD5cblxuLmVsZW1lbnRzIHtcbiAgaGVpZ2h0OiBjYWxjKDEwMCUgLSA1NnB4KTtcbiAgYmFja2dyb3VuZC1jb2xvcjogI2RhZTBlNjtcbiAgY29sb3I6IHdoaXRlO1xuICBkaXNwbGF5OiBmbGV4O1xuICBmbGV4LWRpcmVjdGlvbjogY29sdW1uO1xuICBwYWRkaW5nLWJvdHRvbTogMTJweDtcbiAgb3ZlcmZsb3cteTogYXV0bztcbn1cblxuLmVsZW1lbnQge1xuICBjb2xvcjogI2E2YTI4YztcbiAgZmxleDogMCAwIGF1dG87XG4gIHdpZHRoOiAxMDAlO1xuICBkaXNwbGF5OiBmbGV4O1xufVxuXG4udGltZSB7XG4gIHBhZGRpbmctcmlnaHQ6IDEwcHg7XG4gIGZvbnQtc2l6ZTogMTBweDtcbiAgbWFyZ2luLWxlZnQ6IDE1cHg7XG5cbn1cblxuLm1lc3NhZ2Uge1xuICB3aWR0aDogMTAwJTtcbiAgY29sb3I6IGJsYWNrO1xufVxuXG4ubm90ZXNfd3JpdGUge1xuICBoZWlnaHQ6IDU2cHg7XG4gIGJhY2tncm91bmQ6ICNkYWUwZTY7XG4gIGRpc3BsYXk6IGZsZXg7XG4gIGp1c3RpZnktY29udGVudDogc3BhY2UtYXJvdW5kO1xuICBhbGlnbi1pdGVtczogY2VudGVyO1xufVxuXG4ubm90ZXNfd3JpdGUgaW5wdXQge1xuICB3aWR0aDogNzUlO1xuICBtYXJnaW4tbGVmdDogNiU7XG4gIGJvcmRlcjogbm9uZTtcbiAgb3V0bGluZTogbm9uZTtcbiAgZm9udC1zaXplOiAxNnB4O1xuICBwYWRkaW5nOiAzcHggNXB4O1xuICBmbG9hdDogbGVmdDtcbiAgaGVpZ2h0OiAzNnB4O1xuICBiYWNrZ3JvdW5kLWNvbG9yOiB3aGl0ZTtcbiAgY29sb3I6IGJsYWNrO1xufVxuXG4ubm90ZXNfd3JpdGUgaW5wdXQ6OnBsYWNlaG9sZGVyIHtcbiAgY29sb3I6ICNjY2M7XG59XG5cbi5ub3Rlc19zZW5kIHtcbiAgd2lkdGg6IDMycHg7XG4gIGhlaWdodDogMzJweDtcbiAgZmxvYXQ6IHJpZ2h0O1xuICBib3JkZXItcmFkaXVzOiA1MCU7XG4gIGJhY2tncm91bmQtY29sb3I6ICNmOGQzNDQ7XG4gIG1hcmdpbi1yaWdodDogMTJweDtcbiAgbWFyZ2luLWJvdHRvbTogMnB4O1xuICBjb2xvcjogd2hpdGU7XG4gIGxpbmUtaGVpZ2h0OiAzMnB4O1xuICB0ZXh0LWFsaWduOiBjZW50ZXI7XG59XG5cbi5lbGVtZW50czo6LXdlYmtpdC1zY3JvbGxiYXItdHJhY2sge1xuICBib3gtc2hhZG93OiBpbnNldCAwIDAgNnB4IHJnYmEoMCwgMCwgMCwgMC4zKTtcbiAgYmFja2dyb3VuZC1jb2xvcjogI2E2YTI4Yztcbn1cblxuLmVsZW1lbnRzOjotd2Via2l0LXNjcm9sbGJhciB7XG4gIHdpZHRoOiAzcHg7XG4gIGJhY2tncm91bmQtY29sb3I6IHRyYW5zcGFyZW50O1xufVxuXG4uZWxlbWVudHM6Oi13ZWJraXQtc2Nyb2xsYmFyLXRodW1iIHtcbiAgYmFja2dyb3VuZC1jb2xvcjogI0ZGQzYyOTtcbn1cbjwvc3R5bGU+XG4iLCJpbXBvcnQgbW9kIGZyb20gXCItIS4uLy4uLy4uL25vZGVfbW9kdWxlcy9iYWJlbC1sb2FkZXIvbGliL2luZGV4LmpzIS4uLy4uLy4uL25vZGVfbW9kdWxlcy92dWUtbG9hZGVyL2xpYi9pbmRleC5qcz8/dnVlLWxvYWRlci1vcHRpb25zIS4vTm90ZXNNZXNzYWdlLnZ1ZT92dWUmdHlwZT1zY3JpcHQmbGFuZz1qcyZcIjsgZXhwb3J0IGRlZmF1bHQgbW9kOyBleHBvcnQgKiBmcm9tIFwiLSEuLi8uLi8uLi9ub2RlX21vZHVsZXMvYmFiZWwtbG9hZGVyL2xpYi9pbmRleC5qcyEuLi8uLi8uLi9ub2RlX21vZHVsZXMvdnVlLWxvYWRlci9saWIvaW5kZXguanM/P3Z1ZS1sb2FkZXItb3B0aW9ucyEuL05vdGVzTWVzc2FnZS52dWU/dnVlJnR5cGU9c2NyaXB0Jmxhbmc9anMmXCIiLCJpbXBvcnQgeyByZW5kZXIsIHN0YXRpY1JlbmRlckZucyB9IGZyb20gXCIuL05vdGVzTWVzc2FnZS52dWU/dnVlJnR5cGU9dGVtcGxhdGUmaWQ9Mjk1MDEzNjgmc2NvcGVkPXRydWUmXCJcbmltcG9ydCBzY3JpcHQgZnJvbSBcIi4vTm90ZXNNZXNzYWdlLnZ1ZT92dWUmdHlwZT1zY3JpcHQmbGFuZz1qcyZcIlxuZXhwb3J0ICogZnJvbSBcIi4vTm90ZXNNZXNzYWdlLnZ1ZT92dWUmdHlwZT1zY3JpcHQmbGFuZz1qcyZcIlxuaW1wb3J0IHN0eWxlMCBmcm9tIFwiLi9Ob3Rlc01lc3NhZ2UudnVlP3Z1ZSZ0eXBlPXN0eWxlJmluZGV4PTAmaWQ9Mjk1MDEzNjgmc2NvcGVkPXRydWUmbGFuZz1jc3MmXCJcblxuXG4vKiBub3JtYWxpemUgY29tcG9uZW50ICovXG5pbXBvcnQgbm9ybWFsaXplciBmcm9tIFwiIS4uLy4uLy4uL25vZGVfbW9kdWxlcy92dWUtbG9hZGVyL2xpYi9ydW50aW1lL2NvbXBvbmVudE5vcm1hbGl6ZXIuanNcIlxudmFyIGNvbXBvbmVudCA9IG5vcm1hbGl6ZXIoXG4gIHNjcmlwdCxcbiAgcmVuZGVyLFxuICBzdGF0aWNSZW5kZXJGbnMsXG4gIGZhbHNlLFxuICBudWxsLFxuICBcIjI5NTAxMzY4XCIsXG4gIG51bGxcbiAgXG4pXG5cbmV4cG9ydCBkZWZhdWx0IGNvbXBvbmVudC5leHBvcnRzIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///5019\n')}}]);