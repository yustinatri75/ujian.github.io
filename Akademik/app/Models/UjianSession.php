<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UjianSession
 * 
 * @property int $id
 * @property string|null $judul
 * @property Carbon|null $waktu_mulai
 * @property Carbon|null $waktu_selesai
 * @property float|null $nilai_minimal
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|UjianPeserta[] $ujian_pesertas
 *
 * @package App\Models
 */
class UjianSession extends Model
{
	protected $table = 'ujian_session';

	protected $casts = [
		'nilai_minimal' => 'float'
	];

	protected $dates = [
		'waktu_mulai',
		'waktu_selesai'
	];

	protected $fillable = [
		'judul',
		'waktu_mulai',
		'waktu_selesai',
		'nilai_minimal'
	];

	public function ujian_pesertas()
	{
		return $this->hasMany(UjianPeserta::class, 'sesi_id');
	}
}
