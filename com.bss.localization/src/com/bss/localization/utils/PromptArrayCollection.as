package com.bss.localization.utils {
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;
	import mx.utils.StringUtil;

	public class PromptArrayCollection extends ArrayCollection {
		private var _prompts : ArrayCollection;
		private var _original : ArrayCollection;

		public function PromptArrayCollection(prompts : Array, original : ArrayCollection) {
			_prompts = new ArrayCollection(prompts);
			_original = original;
		}

		override public function getItemAt(index : int, prefetch : int = 0) : Object {
			if ( index < 0 || index >= length )
				throw new RangeError("invalid index", index) ;

			if (index < _prompts.length)
				return _prompts.getItemAt(index, prefetch);

			return _original.getItemAt(index - _prompts.length, prefetch);
		}

		override public function get length() : int {
			return _prompts.length + _original.length;
		}
	}
}

