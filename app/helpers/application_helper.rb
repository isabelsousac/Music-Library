module ApplicationHelper
    def active_class(link_path)
        current_page?(link_path) ? "active" : ""
    end

    def flash_class(level)
        bootstrap_alert_class = {
          "success" => "alert-success",
          "error" => "alert-danger",
          "notice" => "alert-info",
          "alert" => "alert-danger",
          "warn" => "alert-warning"
        }
        bootstrap_alert_class[level]
      end
end
