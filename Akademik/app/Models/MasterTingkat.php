<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class MasterTingkat
 *
 * @property int $tingkat_id
 * @property bool $tingkat_level
 * @property Carbon $tingkat_created_at
 * @property Carbon|null $tingkat_updated_at
 *
 * @property Collection|MasterMatakuliah[] $master_matakuliahs
 *
 * @package App\Models
 */
class MasterTingkat extends Model
{
	protected $table = 'master_tingkat';
	protected $primaryKey = 'tingkat_id';
	public $timestamps = false;

	protected $dates = [
		'tingkat_created_at',
		'tingkat_updated_at'
	];

	protected $fillable = [
		'tingkat_level',
		'tingkat_created_at',
		'tingkat_updated_at'
	];

	public function master_matakuliahs()
	{
		return $this->hasMany(MasterMatakuliah::class, 'makul_tingkat_id');
	}
}
