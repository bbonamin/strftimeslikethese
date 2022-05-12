import { RubyApplication } from 'bormashino'
import rubyDigest from './ruby-digest.js'

const main = async () => {
  const vm = await RubyApplication.initVm('/ruby.' + rubyDigest + '.wasm', [
    'ruby.wasm',
    '-I/stub',
    '-I/gem/lib',
    '-EUTF-8',
    '-e_=0',
  ])

  vm.printVersion()
  vm.eval(`require_relative '/src/bootstrap.rb'`)

  document
    .querySelector('#bormashino-application')
    .addEventListener('bormashino:updated', (e) => {
      attachEventListeners()
    })

  const currentPath = () => location.href.replace(location.origin, '')
  RubyApplication.request('get', currentPath())
  RubyApplication.mount()

  window.bormashino = RubyApplication
}

const attachEventListeners = () => {
  let elements = document.querySelectorAll("input[name='strformat']")
  Array.prototype.forEach.call(elements, function (el, i) {
    el.addEventListener(
      'change',
      function (e) {
        console.log('e!!')
        document.querySelector("input[name='strformat']").value = e.target.value
        document
          .querySelector('#strformat-form')
          .dispatchEvent(new Event('submit', { cancelable: true }))
      },
      false
    )
  })
}

main()
