require 'solidus_core'
# solidus_support: required before the engine, which includes SolidusSupport::EngineExtensions;
# previously relied on Bundler.require load ordering (mirrors solidusio/solidus_dev_support engine template)
require 'solidus_support'
require 'carrierwave'
require 'solidus_flexi_variants/engine'
