-- dev notes: Ollama don't support infill
-- https://huggingface.co/collections/ggml-org/llamavim
-- https://github.com/ggml-org/llama.cpp/tree/master
return {
    'ggml-org/llama.vim',
    init = function()
        vim.g.llama_config = {
            endpoint = 'http://localhost:8012/infill',
            api_key = ' ',
            model = ' ',
            n_predict = 128,
            stop_strings = {},
            t_max_prompt_ms = 500,
            t_max_predict_ms = 500,
            show_info = 2,
            max_line_suffix = 8,
            max_cache_keys = 250,
            ring_n_chunks = 16,
            ring_chunk_size = 64,
            ring_scope = 1024,
            ring_update_ms = 1000,
            keymap_trigger = "<c-m>",
            keymap_accept_full = "<C-i>",
            keymap_accept_line = "",
            keymap_accept_word = "",
            n_prefix = 1024,
            n_suffix = 1024,
            auto_fim = true,
            enable_at_startup = true,
        }
    end,
}
