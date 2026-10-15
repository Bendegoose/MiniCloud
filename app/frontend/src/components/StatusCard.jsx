
import './ComponentStyles/StatusCard.css';

export default function StatusCard({
  name,
  status = 'unknown',
  description = '',
}) {
  const normalizedStatus = status.toLowerCase();

  const statusLabels = {
    online: 'Online',
    offline: 'Offline',
    degraded: 'Degraded',
    unknown: 'Unknown',
  };

  const label = statusLabels[normalizedStatus] ?? 'Unknown';

  return (
    <article className="status-card">
      <div className="status-card__header">
        <h3 className="status-card__name">{name}</h3>

        <span
          className={`status-card__badge status-card__badge--${statusLabels[normalizedStatus] ? normalizedStatus : 'unknown'}`}
          role="status"
        >
          <span className="status-card__dot" />
          {label}
        </span>
      </div>

      {description && (
        <p className="status-card__description">
          {description}
        </p>
      )}
    </article>
  );
}
