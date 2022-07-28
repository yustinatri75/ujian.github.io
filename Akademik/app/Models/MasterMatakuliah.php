<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class MasterMatakuliah
 * 
 * @property int $makul_id
 * @property int $makul_tingkat_id
 * @property string $makul_nama
 * @property string $makul_kode
 * @property Carbon $makul_created_at
 * @property Carbon|null $makul_updated_at
 * 
 * @property MasterTingkat $master_tingkat
 * @property Collection|DataMatakuliah[] $data_matakuliahs
 * @property Collection|MasterDosenPengampu[] $master_dosen_pengampus
 *
 * @package App\Models
 */
class MasterMatakuliah extends Model
{
	protected $table = 'master_matakuliah';
	protected $primaryKey = 'makul_id';
	public $timestamps = false;

	protected $casts = [
		'makul_tingkat_id' => 'int'
	];

	protected $dates = [
		'makul_created_at',
		'makul_updated_at'
	];

	protected $fillable = [
		'makul_tingkat_id',
		'makul_nama',
		'makul_kode',
		'makul_created_at',
		'makul_updated_at'
	];

	public function master_tingkat()
	{
		return $this->belongsTo(MasterTingkat::class, 'makul_tingkat_id');
	}

	public function data_matakuliahs()
	{
		return $this->hasMany(DataMatakuliah::class, 'makul_id');
	}

	public function master_dosen_pengampus()
	{
		return $this->hasMany(MasterDosenPengampu::class, 'dp_makul_id');
	}
}
