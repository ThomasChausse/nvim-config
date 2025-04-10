vim.api.nvim_create_user_command("MasonLogClean", function()
  local log_path = "/home/thomas/.local/state/nvim/mason.log"
  local result = vim.fn.delete(log_path)
  if result == 0 then
    print("✅ Mason log deleted.")
  else
    print("⚠️ No log file to delete or failed.")
  end
end, {})
